# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'design.ui'
##
## Created by: Qt User Interface Compiler version 5.15.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(496, 409)
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.gridLayout = QGridLayout(self.centralwidget)
        self.gridLayout.setObjectName(u"gridLayout")
        self.BD = QPushButton(self.centralwidget)
        self.BD.setObjectName(u"BD")

        self.gridLayout.addWidget(self.BD, 1, 1, 1, 1)

        self.vybor = QTabWidget(self.centralwidget)
        self.vybor.setObjectName(u"vybor")
        self.bibleteka = QWidget()
        self.bibleteka.setObjectName(u"bibleteka")
        self.gridLayout_2 = QGridLayout(self.bibleteka)
        self.gridLayout_2.setObjectName(u"gridLayout_2")
        self.peopleBox = QComboBox(self.bibleteka)
        self.peopleBox.setObjectName(u"peopleBox")

        self.gridLayout_2.addWidget(self.peopleBox, 0, 0, 1, 1)

        self.add = QPushButton(self.bibleteka)
        self.add.setObjectName(u"add")

        self.gridLayout_2.addWidget(self.add, 1, 0, 1, 2)

        self.booksBox = QComboBox(self.bibleteka)
        self.booksBox.setObjectName(u"booksBox")

        self.gridLayout_2.addWidget(self.booksBox, 0, 1, 1, 1)

        self.vybor.addTab(self.bibleteka, "")
        self.dropVolounter = QWidget()
        self.dropVolounter.setObjectName(u"dropVolounter")
        self.gridLayout_3 = QGridLayout(self.dropVolounter)
        self.gridLayout_3.setObjectName(u"gridLayout_3")
        self.volBox = QComboBox(self.dropVolounter)
        self.volBox.setObjectName(u"volBox")

        self.gridLayout_3.addWidget(self.volBox, 0, 1, 1, 1)

        self.drop = QPushButton(self.dropVolounter)
        self.drop.setObjectName(u"drop")

        self.gridLayout_3.addWidget(self.drop, 1, 1, 1, 1)

        self.vybor.addTab(self.dropVolounter, "")
        self.tab = QWidget()
        self.tab.setObjectName(u"tab")
        self.gridLayout_5 = QGridLayout(self.tab)
        self.gridLayout_5.setObjectName(u"gridLayout_5")
        self.chitBox = QComboBox(self.tab)
        self.chitBox.setObjectName(u"chitBox")

        self.gridLayout_5.addWidget(self.chitBox, 0, 0, 1, 1)

        self.volunteerName = QLineEdit(self.tab)
        self.volunteerName.setObjectName(u"volunteerName")

        self.gridLayout_5.addWidget(self.volunteerName, 1, 0, 1, 1)

        self.editName = QPushButton(self.tab)
        self.editName.setObjectName(u"editName")

        self.gridLayout_5.addWidget(self.editName, 2, 0, 1, 1)

        self.vybor.addTab(self.tab, "")
        self.editEvent = QWidget()
        self.editEvent.setObjectName(u"editEvent")
        self.gridLayout_4 = QGridLayout(self.editEvent)
        self.gridLayout_4.setObjectName(u"gridLayout_4")
        self.lineEdit = QLineEdit(self.editEvent)
        self.lineEdit.setObjectName(u"lineEdit")

        self.gridLayout_4.addWidget(self.lineEdit, 1, 0, 1, 1)

        self.dateTimeEdit = QDateTimeEdit(self.editEvent)
        self.dateTimeEdit.setObjectName(u"dateTimeEdit")

        self.gridLayout_4.addWidget(self.dateTimeEdit, 3, 0, 1, 1)

        self.eventBox = QComboBox(self.editEvent)
        self.eventBox.setObjectName(u"eventBox")

        self.gridLayout_4.addWidget(self.eventBox, 5, 0, 1, 1)

        self.textEdit = QTextEdit(self.editEvent)
        self.textEdit.setObjectName(u"textEdit")

        self.gridLayout_4.addWidget(self.textEdit, 7, 0, 1, 1)

        self.edit = QPushButton(self.editEvent)
        self.edit.setObjectName(u"edit")

        self.gridLayout_4.addWidget(self.edit, 8, 0, 1, 1)

        self.label = QLabel(self.editEvent)
        self.label.setObjectName(u"label")

        self.gridLayout_4.addWidget(self.label, 0, 0, 1, 1)

        self.label_2 = QLabel(self.editEvent)
        self.label_2.setObjectName(u"label_2")

        self.gridLayout_4.addWidget(self.label_2, 4, 0, 1, 1)

        self.label_3 = QLabel(self.editEvent)
        self.label_3.setObjectName(u"label_3")

        self.gridLayout_4.addWidget(self.label_3, 2, 0, 1, 1)

        self.label_4 = QLabel(self.editEvent)
        self.label_4.setObjectName(u"label_4")

        self.gridLayout_4.addWidget(self.label_4, 6, 0, 1, 1)

        self.vybor.addTab(self.editEvent, "")

        self.gridLayout.addWidget(self.vybor, 0, 1, 1, 1)

        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(MainWindow)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 496, 18))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QStatusBar(MainWindow)
        self.statusbar.setObjectName(u"statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)

        self.vybor.setCurrentIndex(0)


        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.BD.setText(QCoreApplication.translate("MainWindow", u"\u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0438\u0442\u044c\u0441\u044f \u043a \u0411\u0414", None))
        self.add.setText(QCoreApplication.translate("MainWindow", u"\u0417\u0430\u043f\u0438\u0441\u0430\u0442\u044c", None))
        self.vybor.setTabText(self.vybor.indexOf(self.bibleteka), QCoreApplication.translate("MainWindow", u"\u0414\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u0435 \u0447\u0438\u0442\u0430\u0442\u0435\u043b\u0435\u0439", None))
        self.drop.setText(QCoreApplication.translate("MainWindow", u"\u0423\u0434\u0430\u043b\u0438\u0442\u044c", None))
        self.vybor.setTabText(self.vybor.indexOf(self.dropVolounter), QCoreApplication.translate("MainWindow", u"\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0432\u043e\u043b\u043e\u043d\u0442\u0435\u0440\u0430", None))
        self.editName.setText(QCoreApplication.translate("MainWindow", u"\u0438\u0437\u043c\u0435\u043d\u0438\u0442\u044c", None))
        self.vybor.setTabText(self.vybor.indexOf(self.tab), QCoreApplication.translate("MainWindow", u"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u0438\u043c\u044f \u0447\u0438\u0442\u0430\u0442\u0435\u043b\u044f", None))
        self.edit.setText(QCoreApplication.translate("MainWindow", u"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c", None))
        self.label.setText(QCoreApplication.translate("MainWindow", u"\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0441\u043e\u0431\u044b\u0442\u0438\u044f", None))
        self.label_2.setText(QCoreApplication.translate("MainWindow", u"\u0422\u0438\u043f \u0441\u043e\u0431\u044b\u0442\u0438\u044f", None))
        self.label_3.setText(QCoreApplication.translate("MainWindow", u"\u0412\u0440\u0435\u043c\u044f \u0441\u043e\u0431\u044b\u0442\u0438\u044f", None))
        self.label_4.setText(QCoreApplication.translate("MainWindow", u"\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0441\u043e\u0431\u044b\u0442\u0438\u044f", None))
        self.vybor.setTabText(self.vybor.indexOf(self.editEvent), "")
    # retranslateUi

