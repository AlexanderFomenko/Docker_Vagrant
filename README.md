# Docker_Vagrant

Хост система:
* OS - Ubuntu 18.04
* Kernel - 5.0.0-23-generic
* RAM - 4GB
* CPU: 4
* Vagrant - 2.2.5
* VirtualBox - 5.2.32

### Vagrant
Задача:

Необходимо в виртуальной машине VirtualBox установить Ubuntu Server 16.04, c параметрами hdd 10gb и ram 2gb.

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

1. Cоздаем директорию откуда будет собираться виртуальная машина и производим инициализацию Vagrant среды. В данном примере это директория '/opt/test'.
    > sudo mkdir -v /opt/test
  
    > cd /opt/test
    
    > sudo vagrant init

2. Меняем созданный после инициализации Vagrantfile на файл из данного репозитория
3. В директории '/opt/test' запускаем создание гостевой машины в соответствии с нашим Vagrantfile. В процессе создания, через CLI, vagrant попросит выбрать интерфейс по которому будут доступны Nginx и Tomcat.

    > sudo vagrant up

4. После создания машины необходимо проверить в браузере, что Tomcat доступен через Nginx.

![Screenshot from 2019-08-11 22-28-46](https://user-images.githubusercontent.com/52493338/62838672-3eff3e80-bc88-11e9-92cf-c4694b8e8971.png)

5. Проверим каждый пункт задачи.
  
  * Проверим что все необходимые пакеты присутствуют в системе.
      > for i in "nginx" "jdk" "maven" "git" "postgresql" ; do dpkg --get-selections | grep -v deinstall | grep $i; done
      ![Screenshot from 2019-08-11 23-01-07](https://user-images.githubusercontent.com/52493338/62839072-d9ae4c00-bc8d-11e9-9a81-e23329c50eeb.png)
  
  * Убедимся что в директории '/test/target' лежит собранный проект
  
    ![image](https://user-images.githubusercontent.com/52493338/62839485-1a5c9400-bc93-11e9-804d-83237f03ccf4.png)
   
   * Убедимся что tomcat работает по порту :9090
      > netstat -tulpn | grep 9090
   
   * Проверим настройки прокси сервера Nginx
      > cat /etc/nginx/sites-available/default
    ![image](https://user-images.githubusercontent.com/52493338/62839708-7ecd2280-bc96-11e9-937b-3055b57c242b.png)
   
   * Проверим наличие созданной БД library и что она принадлежит пользователю library_user
      > su - postgres
      
      > psql
      
      > \list
      ![image](https://user-images.githubusercontent.com/52493338/62840598-b98a8700-bca5-11e9-9a72-ec2c32f29e6d.png)
    
   * Подключимся к БД под пользователем library_user с паролем lib123 для проверки наличия всех таблиц, которые были в dumb-файле
      > su - postgres
      
      > psql library library_user
      
      ![image](https://user-images.githubusercontent.com/52493338/62840615-37e72900-bca6-11e9-86aa-d7b93c6de36e.png)
     
   * Проверим что наш собранный проект hello-world-war-1.0.0 присутствует в Tomcat. Для этого перейдем на веб-страницу => 'Manager App'
   
      ![image](https://user-images.githubusercontent.com/52493338/62840670-22beca00-bca7-11e9-9f32-8fc899ca733c.png)
   
   * Далее перейдем по пути '/hello-world-war-1.0.0', чтобы убедиться, что наш проект правильно функционирует
      
      ![image](https://user-images.githubusercontent.com/52493338/62840700-7cbf8f80-bca7-11e9-8e38-c7d5f32e642a.png)
### Docker
Задача:

1. Повторить предыдущую работу сделанную с помощью Vagrant. 
2. Создать Docker-image и выложить на dockerhub.
  
  Решение:
  
  Для решения текущей задачи нам необходимы файлы из директории Docker, присутствующей в данном репозитории.
  
  1. Необходимо перейти в директорию, где находится Dockerfile из данного репозитория. В моем случае это '/opt/test'.
     > cd /opt/test
     
     > Dockerfile определяет, что происходит в среде внутри нашего контейнера
     
  2. Создадим образ, используя параметры из Dockerfile.
      > docker build -t test .
      Где:
        docker build - команда для сбора образа из Dockerfile
        
        -t - указывает что создаваемому образу необходимо предоставить тер ( в моем случае test)
        
        -'.'- указывает что Dockerfile находится в текущей директории
  
  3.
      
  



