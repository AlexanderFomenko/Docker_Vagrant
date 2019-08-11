Docker_Vagrant
Хост система:

OS - Ubuntu 18.04
Kernel - 5.0.0-23-generic
RAM - 4GB
CPU: 4
Vagrant
Задача:

Необходимо в виртуальной машине VirtualBox установить Ubuntu Server 16.04, c параметрами hdd 5gb и ram 2gb.

Далее внутри виртуальной машины установить:

1.Java Oracle 8

2.Apache Tomcat 8

3.Git

4.Apache Maven 3.x

5.Postgresql 9.5.x

6.Nginx 1.11.x

Далее необходимо развернуть приложение:

1.Забрать исходный код из https://p12se@bitbucket.org/p12se/library.git

2.Собрать проект при момощи maven

3.Настроить tomcat на порт 9090

4.Настроить nginx в качестве прокси для tomcat

5.Подготовить базу данных для приложения:

Создать БД library
Создать пользователя library_user с паролем lib123
Восстановить dump базы из файла configuration/dump.sql
6.Развернуть собранное приложение в tomcat
