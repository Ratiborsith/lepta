import sys  # sys нужен для передачи argv в QApplication
from PySide2 import QtWidgets
# ниже код для исправления отвратительной ошибки
from math import sin
import flet
import os
import PySide2
import time

import sqlite3

dirname = os.path.dirname(PySide2.__file__)
plugin_path = os.path.join(dirname, 'plugins', 'platforms')
os.environ['QT_QPA_PLATFORM_PLUGIN_PATH'] = plugin_path

# дальше нормальный код

import design  # Это наш конвертированный файл дизайна


class lepta(QtWidgets.QMainWindow, design.Ui_MainWindow):
    # Конструктор класса
    def __init__(self):
        super().__init__()
        # Создание формы и Ui (наш дизайн)
        self.setupUi(self)

        # свяжем кнопку и метод
        self.add.clicked.connect(self.add_method)
        self.edit.clicked.connect(self.edit_method)
        self.editName.clicked.connect(self.editName_method)
        self.drop.clicked.connect(self.drop_method)
        self.BD.clicked.connect(self.BD_method)

    # Подключение к БД
    def BD_method(self):
        # соединимся с бд
        conn = sqlite3.connect('lepta.db')
        print("Подключение к БД установлено.\n\n")
        cursor = conn.cursor()


        # выполним запрос c получением всех названий книг
        cursor.execute("select title from books;")

        # создадим список со всеми значениями книг
        listBooks = cursor.fetchall()
        # названия всех книг
        listBooksName = []

        for i in range(len(listBooks)):
            listBooksName.append(listBooks[i][0])

        print(listBooksName)
        self.booksBox.clear()
        self.booksBox.addItems(listBooksName)

        # выполним запрос c получением всех читателей-волонтеров
        cursor.execute("select name from volunteer;")

        # создадим список со всеми значениями книг
        listPeople = cursor.fetchall()
        # названия всех книг
        listPeopleName = []

        for i in range(len(listPeople)):
            listPeopleName.append(listPeople[i][0])

        print(listPeopleName)
        self.peopleBox.clear()
        self.peopleBox.addItems(listPeopleName)

        # запишем во вкладку изменения имени и во вкладку удаления
        self.volBox.clear()
        self.volBox.addItems(listPeopleName)

        self.chitBox.clear()
        self.chitBox.addItems(listPeopleName)


    # метод добавления таблицы
    def add_method(self):
        conn = sqlite3.connect('lepta.db')
        print("Подключение к БД установлено.\n\n")
        cursor = conn.cursor()
        # ДОБАВИМ в таблицу библиотеки запись с такими данными

        # сначала получим idшки
        # получим то, что выбрал пользователь
        selectPeople = self.peopleBox.currentText()
        selectBook = self.booksBox.currentText()

        # теперь запрос на получение id читателей и книг с такими именами
        selectPeopleId = cursor.execute("select id from volunteer where name = ?", (selectPeople,)).fetchall()[0][0]
        selectBookId = cursor.execute("select id from books where title = ?", (selectBook,)).fetchall()[0][0]

        # сам запрос непосредственно по добавлению в таблицу выбранных значений
        cursor.execute("INSERT INTO library (id_reader, id_book)VALUES (?, ?);", (str(selectPeopleId), str(selectBookId)))
        conn.commit()
        print("успещно записано")


    # изменение
    def editName_method(self):
        conn = sqlite3.connect('lepta.db')
        print("Подключение к БД установлено.\n\n")
        cursor = conn.cursor()
        # обновим таблицу пользователей
        # сам запрос непосредственно по обновлению
        cursor.execute("UPDATE volunteer SET name = ? WHERE name = ?;",
                       (self.volunteerName.text(), self.chitBox.currentText()))
        conn.commit()
        print("успещно изменено")
    # удаление
    def drop_method(self):
        conn = sqlite3.connect('lepta.db')
        print("Подключение к БД установлено.\n\n")
        cursor = conn.cursor()
        # обновим таблицу пользователей
        # сам запрос непосредственно по обновлению
        cursor.execute("DELETE FROM volunteer WHERE name = ?;",
                       (self.volBox.currentText(),))
        conn.commit()
        print("успещно удалено")

    # изменение события
    def edit_method(self):
        print("2")


def main():
    app = QtWidgets.QApplication(sys.argv)  # Новый экземпляр QApplicationpyqt5designer
    window = lepta()  # Создаём объект класса Base
    window.show()  # Показываем окно
    app.exec_()  # и запускаем приложение

if __name__ == '__main__':  # Если мы запускаем файл напрямую, а не импортируем
    main()  # то запускаем функцию main()