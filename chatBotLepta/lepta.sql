--
-- ���� ������������ � ������� SQLiteStudio v3.4.3 � �� ��� 23 16:00:08 2023
--
-- �������������� ��������� ������: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- �������: achievments
CREATE TABLE achievments (id_event INTEGER REFERENCES events (id) NOT NULL, id_volunteer INTEGER REFERENCES volunteer (id), content TEXT NOT NULL);
INSERT INTO achievments (id_event, id_volunteer, content) VALUES (1, 1, '���������� � ����� � �������� ���������');
INSERT INTO achievments (id_event, id_volunteer, content) VALUES (2, 2, '����');

-- �������: books
CREATE TABLE books (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, author TEXT NOT NULL, date TEXT NOT NULL);
INSERT INTO books (id, title, author, date) VALUES (1, '��� ������������ ������ ��������� ����� � �������� ���������. ���� ������� ��������� ����������� ����� "����������"', '�. �. ������������', '2013');
INSERT INTO books (id, title, author, date) VALUES (2, '������ � �����', '���������� �������� �������', '2016');
INSERT INTO books (id, title, author, date) VALUES (3, '� ������� ����, ������ � �����. ������� �������', '��������� ����', '2014');
INSERT INTO books (id, title, author, date) VALUES (4, '�������� ��������� ����� � �����. ����������� ������', '������ �. �. �������� �. �. ��������� �. �. ������ �. �.', '2018');
INSERT INTO books (id, title, author, date) VALUES (5, '��������� � �����. ��� ����� ������ �������.', '���������� ���� ������. ��������� ������', '2020');
INSERT INTO books (id, title, author, date) VALUES (6, '������� ���� �������� ���������� ����������: �����, ����������, �����������. ��������� ������������� ������-�����������.', '������� �. �. ', '2022');
INSERT INTO books (id, title, author, date) VALUES (7, '��� ��������. 23-3-4. 2022', '���', '2022');
INSERT INTO books (id, title, author, date) VALUES (8, '����������������� �������� �������������� � ���� ���������� �� � �������(������������ �����������)', '������ ���������, ���������', '1970');
INSERT INTO books (id, title, author, date) VALUES (9, '100 �������� ������� ������. ����� 1.  ������ �����', '�������� �������', '2021');
INSERT INTO books (id, title, author, date) VALUES (10, '������������ �����', '���� ����� �� ������', '2021');
INSERT INTO books (id, title, author, date) VALUES (11, '�������. ��������. �������������', '������ ���������', '2007');
INSERT INTO books (id, title, author, date) VALUES (12, '� ��������� ������ ������������ ���� � ��������', '�������� ��� �� �����', '2022');
INSERT INTO books (id, title, author, date) VALUES (13, '���� �����', '������ ������� �������', '2015');
INSERT INTO books (id, title, author, date) VALUES (14, '��������� �������. �� �������� �������� �������� �������(��������)', '������� ��������', '2016');
INSERT INTO books (id, title, author, date) VALUES (15, '������ � ���������', '������ �. ����.', '2018');
INSERT INTO books (id, title, author, date) VALUES (16, '������� ����.', '�. �. ������', '2016');
INSERT INTO books (id, title, author, date) VALUES (17, '�� ������� � � �����', '����. ���������� ����������', '2002');
INSERT INTO books (id, title, author, date) VALUES (18, '� ����� �����. �������, �����������, �������-�����', '����������� �. �.', '2012');
INSERT INTO books (id, title, author, date) VALUES (19, '� ��������� ������', '����. �������� ���������', '2012');
INSERT INTO books (id, title, author, date) VALUES (20, '�������� ����� ���? ����������� ������ 3 �����������', '0', '2012');
INSERT INTO books (id, title, author, date) VALUES (21, '����� � �������, ���������� �������� �� ��������������� ��������� ���� ����� ����������� ���������', '��������� ���������', '1996');
INSERT INTO books (id, title, author, date) VALUES (22, '�������������� ��������� ������', '������� ��������', '2014');
INSERT INTO books (id, title, author, date) VALUES (23, '�������������� ���������� �� �������� ��������', '������� ��������', '2013');
INSERT INTO books (id, title, author, date) VALUES (24, '� ���� ������. ���� ����� � �������.', '�. �. ������', '2016');
INSERT INTO books (id, title, author, date) VALUES (25, '���� ������ ����� ����������, � ���� ����!', '����. �������(������������)', '2017');
INSERT INTO books (id, title, author, date) VALUES (26, '������� ��������. ������������. ����������� ����� ������', '���� �������', '2012');
INSERT INTO books (id, title, author, date) VALUES (27, '������� ������������ ����������', '�. �. �����', '2002');
INSERT INTO books (id, title, author, date) VALUES (28, '� ������ �� ������������ ������.', '����� �''�����', '2007');
INSERT INTO books (id, title, author, date) VALUES (29, '������������. ��������. ��������', '��������', '1975');
INSERT INTO books (id, title, author, date) VALUES (30, '�������� ����������', '�������� ����� �����������', '2018');

-- �������: evangelical_group
CREATE TABLE evangelical_group (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL);
INSERT INTO evangelical_group (id, name) VALUES (1, '����������');
INSERT INTO evangelical_group (id, name) VALUES (2, '����������');
INSERT INTO evangelical_group (id, name) VALUES (3, '�� �����');

-- �������: events
CREATE TABLE events (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, datetime TEXT NOT NULL, id_type INTEGER NOT NULL REFERENCES types_event (id), content TEXT NOT NULL);
INSERT INTO events (id, title, datetime, id_type, content) VALUES (1, '����� � "���������"', '18 ��� � 19:03', 14, '��������������� ����������� "�����" � ������ � ��� "��������� ���������" . ��������� ����� ����� ������ �������� ����� �����������, �� ���� ��� ������ ��������� ��� �������� ��������� ������ ����������. ���������� ������ ��������� ������ ������� ������� ������� ����� ������� ��������� ����� ����� ��������');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (2, '����� � �����������', '12 ��� � 9:31', 14, '���������� �� ������ �������� ������ ������� - ������ � ������� ������ � �. �������� .');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (3, '����� � ����������', '22 ��� � 16:40', 14, '������ ����� ����� � �"�����" �� ���� ������ �� ���� ��� ������� � ������� � ����� ������� � ������� ������� ����� �� ���� "����������� ���" ���� ��� ���������, ���� �� ��� ����� ���������� ������. �������� ��������� ���� �������, ����� �������� ������. ����� ����� ����� "��� ����� �������" ����� ������ � ���,,��� �� ����, �����, ���������� ���. ����� ��������� �� ������ �������� ��������, �� � ���, ��� ��� ���. ��� ������ - ����������, ������ ������, ��� ��� �� ������������. ���� Natalia ��������� ����� ��������� ���������� ��������. � ������ ����� ���������� ������ �������������� ������������ ���������. ���� ������, ���� �����.��������� ������� ����� ��� ����. ����� �� ����� ������� ������� �������� � ����� ���������. ������� ������� �������� ����� Natalia ���� � �����.');
INSERT INTO events (id, title, datetime, id_type, content) VALUES (4, '���� ��������', '18 ��� � 14:54', 7, '������� � ����� ���������� ���������� � �����. ��������� � ����� � ���������. ���� �� ����� �� ������, � �� ������ ���������� �� � ������� � �������� ���� (������� ������� . ������� �� �������: ������������� ������ ��������� � ������ ����� ���� ������� � ������� �����');

-- �������: library
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

-- �������: news
CREATE TABLE news (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, heading TEXT NOT NULL, text TEXT NOT NULL, date TEXT NOT NULL);
INSERT INTO news (id, heading, text, date) VALUES (1, '��� ����� ����������� � �����������? � ���� ��� ����������? ��������� ��� ������������� ���������� ������� ���������.', '��������� �������, ����������� ��������, �������� ���������� � ������������� ���������� �������, ��������� � ����� ���������� ������� ��������� ���� ������.', '23 ��� � 21:17');
INSERT INTO news (id, heading, text, date) VALUES (2, '������ ��������� ���������������� ���� �� ����: "��������� ������������� � ����."', '??1-� ����� ������ ������� "�����"
??2-� ����� "��������"
??3-� ����� - ������� "������"
??4-� ����� - "������" (������������������� ����)
�������� ������� �������� ��������� ������������ ������� ����������� �������. � ���������� ����� �������� ���� �������� ���������� - ������� ��� - ������� "����������" ������ � ������ ������������ ������������. ��� ������� ���� ���������� �������� ������� � � ����� ���������� ������������ ��������. ���� ��� �� ����� ������������!', '21 ��� 2023 � 18:07');

-- �������: roles
CREATE TABLE roles (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL);
INSERT INTO roles (id, title) VALUES (1, '�������������');
INSERT INTO roles (id, title) VALUES (2, '������������ ��������');
INSERT INTO roles (id, title) VALUES (3, '��������');
INSERT INTO roles (id, title) VALUES (4, '�����');
INSERT INTO roles (id, title) VALUES (5, '�������');
INSERT INTO roles (id, title) VALUES (6, '�����-���');
INSERT INTO roles (id, title) VALUES (7, '�������');
INSERT INTO roles (id, title) VALUES (8, '�����������');
INSERT INTO roles (id, title) VALUES (9, '�����������');
INSERT INTO roles (id, title) VALUES (10, '��������');
INSERT INTO roles (id, title) VALUES (11, '������������ �������');
INSERT INTO roles (id, title) VALUES (12, '������');

-- �������: types_event
CREATE TABLE types_event (id INTEGER PRIMARY KEY AUTOINCREMENT, name_type TEXT NOT NULL);
INSERT INTO types_event (id, name_type) VALUES (1, '������������ ������');
INSERT INTO types_event (id, name_type) VALUES (2, '����� � ������');
INSERT INTO types_event (id, name_type) VALUES (3, '����� � ����');
INSERT INTO types_event (id, name_type) VALUES (4, '������������ ������ �����');
INSERT INTO types_event (id, name_type) VALUES (5, '���� ����� ��� �����');
INSERT INTO types_event (id, name_type) VALUES (6, '������ ���������� ������');
INSERT INTO types_event (id, name_type) VALUES (7, '����� � ����� ��������');
INSERT INTO types_event (id, name_type) VALUES (8, '����� ������');
INSERT INTO types_event (id, name_type) VALUES (9, '���������');
INSERT INTO types_event (id, name_type) VALUES (10, '������������ ������');
INSERT INTO types_event (id, name_type) VALUES (11, '�������������');
INSERT INTO types_event (id, name_type) VALUES (12, '������������� �� ���������');
INSERT INTO types_event (id, name_type) VALUES (13, '�������������');
INSERT INTO types_event (id, name_type) VALUES (14, '����� � ��� ����������� � ���������');

-- �������: users
CREATE TABLE users (id INTEGER PRIMARY KEY UNIQUE, name TEXT, status INTEGER);

-- �������: volunteer
CREATE TABLE volunteer (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, age INTEGER NOT NULL DEFAULT (0), religion TEXT NOT NULL DEFAULT �����������, sex TEXT NOT NULL DEFAULT ���, phone_number TEXT NOT NULL DEFAULT ���, id_evangelical_group INTEGER REFERENCES evangelical_group (id) NOT NULL, id_role INTEGER REFERENCES roles (id));
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (1, '������� �������', 20, '�����������', '���', '89173340197', 1, 1);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (2, '����� ��������', 43, '�����������', '���', '+7 937 543 0885', 2, 2);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (3, '������� �.', 20, '����������������', '���', '���', 3, 8);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (4, '������ �������', 69, '����������', '���', '���', 2, 6);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (5, '����� �������', 49, '�����������', '���', '���', 2, 5);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (6, '���� ����������', 39, '�����������', '���', '���', 2, 12);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (7, '����� ������������', 45, '�����������', '���', '���', 2, 4);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (8, '��������� ����������', 35, '�����������', '���', '���', 2, 3);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (9, '��������� �����', 39, '�����������', '���', '���', 2, 3);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (10, '������ �����', 20, '����������', '���', '���', 3, 8);
INSERT INTO volunteer (id, name, age, religion, sex, phone_number, id_evangelical_group, id_role) VALUES (13, '������', 23, '�����', '���', '���', 3, 4);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
