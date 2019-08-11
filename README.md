# Docker_Vagrant

Хост система:
* OS - Ubuntu 18.04
* Kernel - 5.0.0-23-generic
* RAM - 4GB
* CPU: 4

### Vagrant
Задача:

Необходимо в виртуальной машине VirtualBox установить Ubuntu Server 16.04, c параметрами hdd 5gb и ram 2gb.

Далее внутри виртуальной машины установить:

* Java Oracle 8

* Apache Tomcat 8

* Git

* Apache Maven 3.x

* Postgresql 9.5.x

* Nginx 1.10.x

Далее необходимо развернуть приложение:

  1.Забрать исходный код из https://github.com/AlexanderFomenko/Docker_Vagrant.git

  2.Собрать проект при момощи maven
  
  3.Настроить tomcat на порт 9090

  4.Настроить nginx в качестве прокси для tomcat

  5.Подготовить базу данных для приложения:

   * Создать БД library
   * Создать пользователя library_user с паролем lib123
   * Восстановить dump базы из файла configuration/dump.sql
   
  6.Развернуть собранное приложение в tomcat

Решение:

1. Копируем созданный Vagrantfile из репозитория в любую созданную директорию откуда будет собираться виртуальная машина. В данном примере это директория '/opt/test'.
> TEST
