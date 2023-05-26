--
-- Файл сгенерирован с помощью SQLiteStudio v3.4.3 в Вт май 23 16:00:08 2023
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: achievments
CREATE TABLE achievments (id_event INTEGER REFERENCES events (id) NOT NULL, id_volunteer INTEGER REFERENCES volunteer (id), content TEXT NOT NULL);
INSERT INTO achievments (id_event, id_volunteer, content) VALUES (1, 1, 'Участвовал в пении и раздавал вкусняшки');
INSERT INTO achievments (id_event, id_volunteer, content) VALUES (2, 2, 'Пела');

-- Таблица: books
CREATE TABLE books (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, author TEXT NOT NULL, date TEXT NOT NULL);
INSERT INTO books (id, title, author, date) VALUES (1, 'Как организовать помощь кризисным семья в сельской местности. Опыт курской областной организации Центр "Милосердие"', 'Е. Б. Савостьянова', '2013');
INSERT INTO books (id, title, author, date) VALUES (2, 'Беседы о семье', 'протоиерей Димитрий Смирнов', '2016');
INSERT INTO books (id, title, author, date) VALUES (3, 'В поисках пути, истины и жизни. История религии', 'Александр Мень', '2014');
INSERT INTO books (id, title, author, date) VALUES (4, 'Создание доступной среды в храме. Комплексный подход', 'Чистый С. В. Зальцман Т. В. Леонтьева В. В. Авдеев А. В.', '2018');
INSERT INTO books (id, title, author, date) VALUES (5, 'Алкоголик в семье. Чем могут помочь близкие.', 'Протоиерей Илия Шугаев. Екатерина Савина', '2020');
INSERT INTO books (id, title, author, date) VALUES (6, 'Мировой опыт служения больничных капелланов: право, психология, организация. Материалы международной онлайн-конференции.', 'Карпова И. В. ', '2022');
INSERT INTO books (id, title, author, date) VALUES (7, 'ББИ Страницы. 23-3-4. 2022', 'ББИ', '2022');
INSERT INTO books (id, title, author, date) VALUES (8, 'Экспериментальные методики патопсихологии и опыт применения их в клинике(практическое руководство)', 'феофан Затворник, святитель', '1970');
INSERT INTO books (id, title, author, date) VALUES (9, '100 ключевых текстов Библии. Часть 1.  Ветхий завет', 'Владимир Стрелов', '2021');
INSERT INTO books (id, title, author, date) VALUES (10, 'Божественная среда', 'Пьер Тейяр Де Шарден', '2021');
INSERT INTO books (id, title, author, date) VALUES (11, 'Писание. Предание. Современность', 'Андрей Десницкий', '2007');
INSERT INTO books (id, title, author, date) VALUES (12, 'И произвела земля… Христианская вера и эволюция', 'Гайсберт ван де бринк', '2022');
INSERT INTO books (id, title, author, date) VALUES (13, 'Люди Божии', 'Старец Арсений Исихаст', '2015');
INSERT INTO books (id, title, author, date) VALUES (14, 'Избранные молитвы. Из наследия братства Епископа Макария(Опоцкого)', 'Георгий Кочетков', '2016');
INSERT INTO books (id, title, author, date) VALUES (15, 'Пролог в поучениях', 'Гурьев В. Прот.', '2018');
INSERT INTO books (id, title, author, date) VALUES (16, 'Любящий отец.', 'Д. А. Щербак', '2016');
INSERT INTO books (id, title, author, date) VALUES (17, 'На приходе и в семье', 'Прот. Константин Островский', '2002');
INSERT INTO books (id, title, author, date) VALUES (18, 'В кругу семьи. Загадки, головоломки, загадки-шутки', 'Скрынникова Р. К.', '2012');
INSERT INTO books (id, title, author, date) VALUES (19, 'О смешанных браках', 'Прот. Владимир Башкирова', '2012');
INSERT INTO books (id, title, author, date) VALUES (20, 'Апостолы среди нас? Особенности миссии 3 тысячелетия', '0', '2012');
INSERT INTO books (id, title, author, date) VALUES (21, 'Книга о логикее, содержащая объемное ис систематическое изложение этой науки профессором философии', 'Александр Никифоров', '1996');
INSERT INTO books (id, title, author, date) VALUES (22, 'Святоотеческое понимание миссии', 'Георгий Максимов', '2014');
INSERT INTO books (id, title, author, date) VALUES (23, 'Святоотеческое толкование на соборные послания', 'Георгий Максимов', '2013');
INSERT INTO books (id, title, author, date) VALUES (24, 'У стен Церкви. Моим детям и друзьям.', 'С. И. Фудель', '2016');
INSERT INTO books (id, title, author, date) VALUES (25, 'Если вечная жизнь существует, я хочу жить!', 'Митр. Николай(Хаджиниколау)', '2017');
INSERT INTO books (id, title, author, date) VALUES (26, 'Границы личности. Перезагрузка. Предисловие Генри Клауда', 'Джон Таусенд', '2012');
INSERT INTO books (id, title, author, date) VALUES (27, 'Природа человеческих конфликтов', 'А. Р. Лурия', '2002');
INSERT INTO books (id, title, author, date) VALUES (28, 'В погоне за ускользающим светом.', 'Юджин О''Келли', '2007');
INSERT INTO books (id, title, author, date) VALUES (29, 'Деятельность. Сознание. Личность', 'Леонтьев', '1975');
INSERT INTO books (id, title, author, date) VALUES (30, 'Духовный азбуковник', 'Схимонах Иосиф Ватопедский', '2018');

-- Таблица: evangelical_group
CREATE TABLE evangelical_group (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL);
INSERT INTO evangelical_group (id, name) VALUES (1, 'молодежная');
INSERT INTO evangelical_group (id, name) VALUES (2, 'возрастная');
INSERT INTO evangelical_group (id, name) VALUES (3, 'не ходит');

-- Таблица: events
CREATE TABLE events (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, datetime TEXT NOT NULL, id_type INTEGER NOT NULL REFERENCES types_event (id), content TEXT NOT NULL);
INSERT INTO events (id, title, datetime, id_type, content) VALUES (1, 'выезд в "Благодать"', '18 фев в 19:03', 14, 'Добровольческое объединение "Лепта" в гостях у АНО "Пансионат Благодать" . Посещение этого места всегда вызывает много впечатлений, на этот раз своими талантами нас удивляли некоторые жители пансионата. Благодарим добрых лептовцев Андрей Маламан Ратибор Полешко Елена Чиркова Александр Бреус Ольга Еремкина');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (2, 'Выезд в Ергенинский', '12 фев в 9:31', 14, 'Помолитесь за нашего дорогого Андрей Маламан - поехал в составе группы в г. Антрацит .');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (3, 'Выезд в Ергениский', '22 янв в 16:40', 14, 'Второй поход нашей Д О"Лепта" на этой неделе на этот раз выдался в субботу к нашим любимым и дорогим жителям ГБССУ СО ГПВИ "Ергенинский ДПИ" Поем про Рождество, ведь не так давно окончились Святки. Радостно подпевают сами зрители, слыша знакомые напевы. Потом после песни "Под небом голубым" задаю вопрос в зал,,что за орел, телец, огнегривый лев. Ответ шокировал не только глубиной познания, но и тем, кто его дал. Наш Матвей - колясочник, громко сказал, что это из Апокалипсиса. Наша Natalia расширила ответ смысловым прочтением символов. А Матвей решил прославить Христа стихотворением собственного сочинения. Пели вместе, было тепло.Попросили сыграть песню про маму. Потом от Лепты вручили сладкие гостинцы в честь праздника. Спасибо дорогим Светлана Ольга Natalia Влад и семья.');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (4, 'Дети Донбасса', '18 янв в 14:54', 7, 'Сходили в пункт временного размещения к детям. Рождество в лицах и хороводах. Дети на месте не сидели, и мы весело подключили их к Ручейку и снежному кому (Люсьена Киселёва . Спасибо за подарки: Богоявленский приход Волгоград и фрукты детям Артём Артемов и Татьяна Турок');

-- Таблица: library
CREATE TABLE library (id_reader INTEGER NOT NULL REFERENCES volunteer (id), id_book INTEGER REFERENCES books (id));
INSERT INTO library (id_reader, id_book) VALUES (1, 2);
INSERT INTO library (id_reader, id_book) VALUES (3, 4);
INSERT INTO library (id_reader, id_book) VALUES (6, 4);
INSERT INTO library (id_reader, id_book) VALUES (3, 3);
INSERT INTO library (id_reader, id_book) VALUES (2, 5);
INSERT INTO library (id_reader, id_book) VALUES (4, 7);
INSERT INTO library (id_reader, id_book) VALUES (5, 10);
INSERT INTO library (id_reader, id_book) VALUES (3, 1);
INSERT INTO library (id_reader, id_book) VALUES (1, 15);
INSERT INTO library (id_reader, id_book) VALUES (6, 1);
INSERT INTO library (id_reader, id_book) VALUES (10, 27);
INSERT INTO library (id_reader, id_book) VALUES (7, 2);
INSERT INTO library (id_reader, id_book) VALUES (2, 29);

-- Таблица: news
CREATE TABLE news (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, heading TEXT NOT NULL, text TEXT NOT NULL, date TEXT NOT NULL);
INSERT INTO news (id, heading, text, date) VALUES (1, 'Что самое необходимое в библеистике? С чего она начинается? Рефлексия над размышлениями протоиерея Леонида Грилихеса.', 'Продолжая рубрику, посвященную экзегезе, процессу толкования и интерпретации библейских текстов, обратимся к книге протоиерея Леонида Грилихеса «Дом Иисуса».', '23 фев в 21:17');
INSERT INTO news (id, heading, text, date) VALUES (2, 'Прошла очередная интеллектуальная игра на тему: "Церковное сопротивление в СССР."', '??1-е место заняла команда "Север"
??2-е место "Соборяне"
??3-е место - команда "Восток"
??4-е место - "Росток" (Крестовоздвиженский храм)
Изучение истории помогает осмыслить происходящие события актуального периода. В промежутке между раундами отец Григорий Мусохранов - ведущий игр - устроил "дегустацию" ладана и кадила собственного производства. Все команды были награждены книжными призами и в конце состоялось традиционное чаепитие. Ждем вас на наших мероприятиях!', '21 фев 2023 в 18:07');

-- Таблица: roles
CREATE TABLE roles (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL);
INSERT INTO roles (id, title) VALUES (1, 'администратор');
INSERT INTO roles (id, title) VALUES (2, 'руководитель движения');
INSERT INTO roles (id, title) VALUES (3, 'водитель');
INSERT INTO roles (id, title) VALUES (4, 'певец');
INSERT INTO roles (id, title) VALUES (5, 'скрипач');
INSERT INTO roles (id, title) VALUES (6, 'фронт-мен');
INSERT INTO roles (id, title) VALUES (7, 'меценат');
INSERT INTO roles (id, title) VALUES (8, 'программист');
INSERT INTO roles (id, title) VALUES (9, 'организатор');
INSERT INTO roles (id, title) VALUES (10, 'гитарист');
INSERT INTO roles (id, title) VALUES (11, 'жертвователь обычный');
INSERT INTO roles (id, title) VALUES (12, 'ничего');

-- Таблица: types_event
CREATE TABLE types_event (id INTEGER PRIMARY KEY AUTOINCREMENT, name_type TEXT NOT NULL);
INSERT INTO types_event (id, name_type) VALUES (1, 'гуманитарная помощь');
INSERT INTO types_event (id, name_type) VALUES (2, 'выезд в хоспис');
INSERT INTO types_event (id, name_type) VALUES (3, 'выезд в храм');
INSERT INTO types_event (id, name_type) VALUES (4, 'материальная помощь храму');
INSERT INTO types_event (id, name_type) VALUES (5, 'сбор вещей для детей');
INSERT INTO types_event (id, name_type) VALUES (6, 'помощь малоимущим семьям');
INSERT INTO types_event (id, name_type) VALUES (7, 'выезд к детям Донбасса');
INSERT INTO types_event (id, name_type) VALUES (8, 'отдых вместе');
INSERT INTO types_event (id, name_type) VALUES (9, 'экодесант');
INSERT INTO types_event (id, name_type) VALUES (10, 'евангельский кружок');
INSERT INTO types_event (id, name_type) VALUES (11, 'велоэкскурсия');
INSERT INTO types_event (id, name_type) VALUES (12, 'паломничество на байдарках');
INSERT INTO types_event (id, name_type) VALUES (13, 'паломничество');
INSERT INTO types_event (id, name_type) VALUES (14, 'Выезд в дом престарелых и инвалидов');

-- Таблица: users
CREATE TABLE users (id INTEGER PRIMARY KEY UNIQUE, name TEXT, status INTEGER);

-- Таблица: volunteer
CREATE TABLE volunteer (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, age INTEGER NOT NULL DEFAULT (0), religion TEXT NOT NULL DEFAULT Православие, sex TEXT NOT NULL DEFAULT муж, phone_number TEXT NOT NULL DEFAULT нет, id_evangelical_group INTEGER REFERENCES evangelical_group (id) NOT NULL, id_role INTEGER REFERENCES roles (id));
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (1, 'Ратибор Полешко', 20, 'Православие', 'муж', '89173340197', 1, 1);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (2, 'Мария Смирнова', 43, 'Православие', 'жен', '+7 937 543 0885', 2, 2);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (3, 'Козякин А.', 20, 'Невоцерковленный', 'муж', 'нет', 3, 8);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (4, 'Андрей Маламан', 69, 'Католицизм', 'муж', 'нет', 2, 6);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (5, 'Елена Чиркова', 49, 'Православие', 'жен', 'нет', 2, 5);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (6, 'Юлия Павшинцева', 39, 'Православие', 'жен', 'нет', 2, 12);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (7, 'Елена Варфоломеева', 45, 'Православие', 'жен', 'нет', 2, 4);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (8, 'Александр Колмогоров', 35, 'Православие', 'муж', 'нет', 2, 3);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (9, 'Александр Бреус', 39, 'Православие', 'муж', 'нет', 2, 3);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (10, 'Никита Орлов', 20, 'Неверующий', 'муж', 'нет', 3, 8);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (13, 'авпвап', 23, 'апвап', 'муж', 'нет', 3, 4);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
