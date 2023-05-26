import telebot
import sqlite3
import threading

# Set up the bot
bot = telebot.TeleBot('5955248246:AAEZVJIeW8K7zTNry1kkYYiFsJtWiiRF3C0')

# Connect to the SQLite database
conn = sqlite3.connect('lepta.db', check_same_thread=False)
cursor = conn.cursor()

# Create the user table if it doesn't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        status TEXT
    )
''')
conn.commit()

# Store the user's status and username
user_status = {}
user_username = {}


# Handler for the "/start" command
@bot.message_handler(commands=['start'])
def start(message):
    # Send a welcome message and the status selection keyboard
    bot.reply_to(message, 'Добро пожаловать в телеграмм-бот волонтерского движения "Лепта".'
                          'Немного о нас:Братья и сестры из "Лепты" - это команда неравнодушных христиан, которые пытаются немного скрасить будни тех, кто нуждается в поддержке, привнеся в них радость, светлую радость о Боге и надежду на Него. Так случилось, что мы обнаружили в себе талант, которым владеем, и решили именно им послужить Богу и людям. Наше волонтерство и миссия опосредованы музыкой, поэтому взаимно отрадны и слушателям, и нам самим. Ежемесячно мы собираемся, чтобы прийти или в хоспис, или в интернат. Есть также мастерская "Конкордия", где добрые мастера помогают подготовиться к ярмарке. Периодически, участвуя в ярмарках, мы собираем средства на помощь хоспису и интернату, и другие дела благотворительности. С хосписом мы сотрудничаем около пяти лет. Хоспис - это чаще всего последнее пристанище для тяжело больных людей. Интернат - это пристанище для пожилых, которые нуждаются в медицинском уходе, и инвалидов, за которыми некому или тяжело ухаживать в миру. Среди инвалидов не мало молодых. Легко ли такое служение? На первый взгляд, ничего хитрого: что может быть легче того, что умеешь? Но с другой стороны, видя глаза и печали тех, кому ты все это адресуешь, ты чувствуешь, что не в состоянии помочь бОльшим. И единственно верным может быть понимание того, что Господь и не требует от нас этого бОльшего, потому что остальное - это Его вотчина. И значимы здесь только наши сердца, открытые зову Господа, Который нас сюда и привел. Если вы обладаете той лептой, которой можете помочь, присоединяйтесь. Вас ждут там!\n'
                          '\nНаш телеграмм-бот предназначен для взаимодействия с волонтерами, организациями и администраторами. Для продолжения нажмите на статус, который вам необходим:', reply_markup=get_status_keyboard())



# Handler for status selection
@bot.message_handler(func=lambda message: True and message.from_user.username not in user_username)
def handle_status(message):
    if message.text == 'Exit':
        handle_exit(message)
        return

    username = message.from_user.username

    status = message.text

    # Check if the selected status is valid
    if status in ['administrator', 'institution', 'volunteer']:
        if status == 'administrator':
            # Ask for password
            bot.reply_to(message, 'Please enter the password for administrator access:')
        else:
            # Insert the user into the database in a separate thread
            threading.Thread(target=insert_user, args=(username, status)).start()

            # Send the exit button
            bot.reply_to(message, 'You have selected "{}" status.'.format(status), reply_markup=get_exit_volunteer_keyboard())

        # Store the user's status and username
        user_status[username] = status
        user_username[username] = username
    else:
        bot.reply_to(message, 'Invalid status. Please select a valid status.')


# Handler for password input
@bot.message_handler(func=lambda message: message.text != 'Exit' and message.from_user.username in user_username and user_status[message.from_user.username] == 'administrator' and not user_exists(message.from_user.username, 'administrator'))
def handle_password(message):
    username = message.from_user.username

    # Check if the entered password is correct
    if message.text == 'lepta':
        # Insert the user into the database in a separate thread
        threading.Thread(target=insert_user, args=(username, 'administrator')).start()

        # Send the exit button
        bot.reply_to(message, 'You have successfully logged in as an administrator.', reply_markup=get_exit_keyboard())
    else:
        bot.reply_to(message, 'Incorrect password. Please try again or go back to the status selection.')


# Handler for the exit button
@bot.message_handler(func=lambda message: message.text == 'Exit')
def handle_exit(message):
    username = message.from_user.username

    # Delete the user record from the database in a separate thread
    threading.Thread(target=delete_user, args=(username,)).start()

    # Reset the user's status and username
    del user_status[username]
    del user_username[username]

    # Send a confirmation message and the status selection keyboard
    bot.reply_to(message, 'Your record has been deleted. Please select your status:', reply_markup=get_status_keyboard())


# Handler for "analytical request1" button
@bot.message_handler(func=lambda message: message.text == 'Запрос 1' and message.from_user.username in user_username)
def handle_request1(message):
    # Handle the analytical request 1
    username = message.from_user.username
    status = user_status[username]

    bot.reply_to(message,
                 'Выполняется аналитический запрос #1 к базе данных для пользователя "{}" with status "{}".'.format(
                     username, status))
    bot.reply_to(message,
                 'Суть запроса: Показать всех людей, которых ходят на молодежную евангельскую группу.')

    select_cursor = conn.cursor()
    select_cursor.execute('''
    SELECT v.name
    FROM volunteer v
    JOIN evangelical_group eg ON v.id_evangelical_group = eg.id
    WHERE eg.name = 'молодежная'
''')
    #print(f"Результат запроса: {select_cursor.fetchall()}")
    string1 = str(select_cursor.fetchall())
    bot.reply_to(message, f"Результат запроса: {string1}")


# Handler for "analytical request2" button
@bot.message_handler(func=lambda message: message.text == 'Запрос 2' and message.from_user.username in user_username)
def handle_request2(message):
    # Handle the analytical request 1
    username = message.from_user.username
    status = user_status[username]

    bot.reply_to(message,
                 'Выполняется аналитический запрос #2 к базе данных для пользователя "{}" with status "{}".'.format(
                     username, status))
    bot.reply_to(message,
                 'Вывести общее кол-во волонтёров одной и той же роли и являющихся мужчинами. Роль - "актер"')

    select_cursor = conn.cursor()
    select_cursor.execute('''
        SELECT COUNT(*) AS total_count
        FROM volunteer v
        JOIN roles r ON v.id_role = r.id
        WHERE v.sex = 'муж' AND r.title = 'водитель'
    ''')
    # print(f"Результат запроса: {select_cursor.fetchall()}")
    string1 = str(select_cursor.fetchall())
    bot.reply_to(message, f"Результат запроса: {string1}")


@bot.message_handler(func=lambda message: message.text == 'Удалить волонтера' and
                                          message.from_user.username in user_username and
                                          user_status[message.from_user.username] == 'administrator')
def handle_delete_volunteer(message):
    # Handle the request to delete a volunteer
    username = message.from_user.username
    status = user_status[username]

    bot.reply_to(message, 'Эта функция позволяет удалить выбранного волонтера.')

    # Get the list of all volunteers' names
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT name FROM volunteer')
    volunteer_names = select_cursor.fetchall()

    if len(volunteer_names) == 0:
        bot.reply_to(message, 'В базе данных отсутствуют волонтеры.')
        return

    # Format the list of names as a string
    names_string = '\n'.join([name[0] for name in volunteer_names])
    bot.reply_to(message, f'Список волонтеров:\n{names_string}')

    # Prompt the user to select a volunteer to delete
    bot.reply_to(message, 'Введите имя волонтера, которого нужно удалить:')
    bot.register_next_step_handler(message, delete_volunteer)

def delete_volunteer(message):
    volunteer_name = message.text

    # Check if the volunteer exists
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT name FROM volunteer WHERE name = ?', (volunteer_name,))
    volunteer = select_cursor.fetchone()

    if volunteer is None:
        bot.reply_to(message, 'Выбранный волонтер не найден. Повторите ввод.')
        return

    # Delete the volunteer from the database
    delete_cursor = conn.cursor()
    delete_cursor.execute('DELETE FROM volunteer WHERE name = ?', (volunteer_name,))
    conn.commit()

    bot.reply_to(message, f'Волонтер {volunteer_name} успешно удален из базы данных!')


@bot.message_handler(func=lambda message: message.text == 'Изменить роль волонтера' and
                                          message.from_user.username in user_username and
                                          user_status[message.from_user.username] == 'administrator')
def handle_update_role(message):
    # Handle the request to update volunteer role
    username = message.from_user.username
    status = user_status[username]

    bot.reply_to(message, 'Эта функция позволяет обновить роль выбранного волонтера.')

    # Get the list of all volunteers' names
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT name FROM volunteer')
    volunteer_names = select_cursor.fetchall()

    if len(volunteer_names) == 0:
        bot.reply_to(message, 'В базе данных отсутствуют волонтеры.')
        return

    # Format the list of names as a string
    names_string = '\n'.join([name[0] for name in volunteer_names])
    bot.reply_to(message, f'Список волонтеров:\n{names_string}')

    # Get the list of all roles with their ids
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT id, title FROM roles')
    roles = select_cursor.fetchall()

    if len(roles) == 0:
        bot.reply_to(message, 'В базе данных отсутствуют роли.')
        return

    # Format the list of roles with ids as a string
    roles_string = '\n'.join([f"{role[0]} - {role[1]}" for role in roles])
    bot.reply_to(message, f'Список доступных ролей:\n{roles_string}')

    # Prompt the user to select a volunteer
    bot.reply_to(message, 'Введите имя волонтера, роль которого нужно обновить:')
    bot.register_next_step_handler(message, update_volunteer_role)

def update_volunteer_role(message):
    volunteer_name = message.text

    # Check if the volunteer exists
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT name FROM volunteer WHERE name = ?', (volunteer_name,))
    volunteer = select_cursor.fetchone()

    if volunteer is None:
        bot.reply_to(message, 'Выбранный волонтер не найден. Повторите ввод.')
        return

    # Prompt the user to enter the new role
    bot.reply_to(message, 'Введите id роли(их список представлен выше) для волонтера:')
    bot.register_next_step_handler(message, process_updated_role, volunteer_name)

def process_updated_role(message, volunteer_name):
    new_role = message.text

    # Update the volunteer's role in the database
    update_cursor = conn.cursor()
    update_cursor.execute('UPDATE volunteer SET id_role = ? WHERE name = ?', (new_role, volunteer_name))
    conn.commit()

    bot.reply_to(message, f'Роль волонтера {volunteer_name} успешно обновлена на {new_role}!')


# глобальные переменные для записи волонтера
id_role = None
id_evangelical_group = None
phone_number = None
sex = None
religion = None
age = None

@bot.message_handler(func=lambda message: message.text == 'Добавить волонтера в базу' and
                                          message.from_user.username in user_username and
                                          user_status[message.from_user.username] == 'administrator')
def handle_insert_volunteer(message):
    # Handle the analytical request 1
    username = message.from_user.username
    status = user_status[username]

    bot.reply_to(message, 'Эта функция позволяет добавить указанного волонтера в базу данных. Напишите любое сообщение, чтобы продолжить')

    # Ввод данных
    bot.register_next_step_handler(message, ask_id_role)

def ask_id_role(message):
    bot.reply_to(message, 'Введите id_role:')
    bot.register_next_step_handler(message, ask_id_evangelical_group)

def ask_id_evangelical_group(message):
    global id_role
    id_role = message.text
    bot.reply_to(message, 'Введите id_evangelical_group:')
    bot.register_next_step_handler(message, ask_phone_number)

def ask_phone_number(message):
    global id_evangelical_group
    id_evangelical_group = message.text
    bot.reply_to(message, 'Введите phone_number:')
    bot.register_next_step_handler(message, ask_sex)

def ask_sex(message):
    global phone_number
    phone_number = message.text
    bot.reply_to(message, 'Введите sex:')
    bot.register_next_step_handler(message, ask_religion)

def ask_religion(message):
    global sex
    sex = message.text
    bot.reply_to(message, 'Введите religion:')
    bot.register_next_step_handler(message, ask_age)

def ask_age(message):
    global religion
    religion = message.text
    bot.reply_to(message, 'Введите age:')
    bot.register_next_step_handler(message, ask_name)

def ask_name(message):
    global age
    age = message.text
    bot.reply_to(message, 'Введите name:')
    bot.register_next_step_handler(message, save_volunteer)

def save_volunteer(message):
    name = message.text

    try:
        # Занесение данных в таблицу
        insert_cursor = conn.cursor()
        insert_cursor.execute('''
        INSERT INTO volunteer (
                              id_role,
                              id_evangelical_group,
                              phone_number,
                              sex,
                              religion,
                              age,
                              name
                          )
                          VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', (int(id_role), int(id_evangelical_group), phone_number, sex, religion, int(age), name))
        conn.commit()

        bot.reply_to(message, 'Волонтер с указанными данными добавлен!')

    except Exception as e:
        # Handle the error
        error_message = f'Ошибка при добавлении волонтера: {str(e)}. Введите данные заново и корректно!'
        bot.reply_to(message, error_message)


# прочие функции
# Helper function to insert a user into the database
def insert_user(username, status):
    insert_cursor = conn.cursor()
    insert_cursor.execute('INSERT INTO users (name, status) VALUES (?, ?)', (username, status))
    conn.commit()


# Helper function to delete a user from the database
def delete_user(username):
    delete_cursor = conn.cursor()
    delete_cursor.execute('DELETE FROM users WHERE name=?', (username,))
    conn.commit()


# Helper function to create the status selection keyboard
def get_status_keyboard():
    keyboard = telebot.types.ReplyKeyboardMarkup(resize_keyboard=True)
    keyboard.row('administrator', 'institution', 'volunteer')
    return keyboard


# Helper function to create the exit button keyboard
def get_exit_keyboard():
    keyboard = telebot.types.ReplyKeyboardMarkup(resize_keyboard=True)
    keyboard.row('Exit', 'Запрос 1', 'Запрос 2', 'Добавить волонтера в базу', "Изменить роль волонтера", "Удалить волонтера")
    return keyboard

def get_exit_volunteer_keyboard():
    keyboard = telebot.types.ReplyKeyboardMarkup(resize_keyboard=True)
    keyboard.row('Exit', 'Узнать подопечного волонтера')
    return keyboard

# Helper function to check if a user with a specific status exists in the database
def user_exists(username, status):
    select_cursor = conn.cursor()
    select_cursor.execute('SELECT * FROM users WHERE name=? AND status=?', (username, status))
    return select_cursor.fetchone() is not None


# Start the bot
bot.polling()
