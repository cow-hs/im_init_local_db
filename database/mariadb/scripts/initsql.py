# -*- coding: utf-8 -*-

import glob
import os
import sys
import re
import subprocess
import time

# 인코딩 설정
sys.stdout.reconfigure(encoding='utf-8')

try:
    import mariadb
except ModuleNotFoundError:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "mariadb"])
    import mariadb  # 다시 임포트 시도

# MariaDB가 준비될 때까지 기다림
def wait_for_mariadb():
    while True:
        try:
            conn = mariadb.connect(
                user=_user,
                password=_password,
                host=_host,
                port=int(_port)
            )
            conn.close()
            break
        except mariadb.Error:
            print("Waiting for MariaDB to be ready...")
            time.sleep(2)

_database = ["config", "game", "ironsecurity", "bill"]
_user = "root"
_password = "1234"
_host = "mariadb"  # Docker 컨테이너의 서비스 이름으로 변경
_port = 3306
_workpath = str(os.path.dirname(os.path.abspath(__file__)))

def createDataBase():
    path = f"/sql/_DataBase/**"
    file_list = glob.glob(path, recursive=True)
    print(file_list)
    file_list_sql = [file for file in file_list if file.endswith(".sql")]

    try:
        conn = mariadb.connect(
            user=_user,
            password=_password,
            host=_host,
            port=int(_port),
            autocommit=True
        )

        cur = conn.cursor()

        for file in file_list_sql:
            print(file)
            with open(file, 'r', encoding='utf8') as f:
                read = f.read()
                sql_commands = read.split(';')

                for command in sql_commands:
                    if command.strip() != '':
                        cur.execute(command)
    except mariadb.Error as e:
        print("●●●●●●●●●●●●●●●●●●")
        print("●●●●●●●●●●●●●●●●●●")
        print(f"ERROR : {e}")
        print("●●●●●●●●●●●●●●●●●●")
        print("●●●●●●●●●●●●●●●●●●")
        sys.exit(1)
    finally:
        conn.close()

def initializeMaria():
    print('Argument : {}'.format(_database))

    for database in _database:
        path = f"/sql/{database}/**"
        file_list = glob.glob(path, recursive=True)
        file_list_sql = [file for file in file_list if file.endswith(".sql")]

        try:
            conn = mariadb.connect(
                user=_user,
                password=_password,
                host=_host,
                port=int(_port),
                database=database,
                autocommit=True
            )

            cur = conn.cursor()

            for file in file_list_sql:
                if re.search("sp_", str(file)):
                    print('query : ' + file)
                    with open(file, 'r', encoding='utf8') as f:
                        read = f.read()
                        sp = ''
                        sql_commands = read.split(';')

                        for command in sql_commands:
                            if command.strip() != '':
                                if sp.strip() != '' or (
                                        re.search('CREATE ', str(command)) and re.search('PROCEDURE ', str(command))):
                                    sp += command + ";"
                                else:
                                    cur.execute(command)

                        sp = sp.replace('DELIMITER', '')
                        sp = sp.replace('$$', '')
                        cur.execute(sp)
                else:
                    print('query : ' + file)
                    with open(file, 'r', encoding='utf8') as f:
                        read = f.read()
                        sql_commands = read.split(';')

                        for command in sql_commands:
                            if command.strip() != '':
                                cur.execute(command)

        except mariadb.Error as e:
            print("●●●●●●●●●●●●●●●●●●")
            print("●●●●●●●●●●●●●●●●●●")
            print(f"ERROR : {e}")
            print(f"ERROR : {database} / {file}")
            print("●●●●●●●●●●●●●●●●●●")
            print("●●●●●●●●●●●●●●●●●●")
            sys.exit(1)
        finally:
            conn.close()

def renderinfomation():
    argument = sys.argv
    del argument[0]

    print("")
    if len(argument) == 7:
        global _user
        global _password
        global _host
        global _port

        _user = argument[0]
        _password = argument[1]
        _host = argument[2]
        _port = argument[3]

        print('Argument : {}'.format(argument))
        print(" ----------- start argument ----------- ")

    else:
        print("----------- global setting  -----------")

    print("id : " + _user)
    print("pw : " + _password)
    print("host : " + _host)
    print("port : ", _port)
    print("work path : " + _workpath)
    print("---------------------------------------")
    print("")

if __name__ == '__main__':
    renderinfomation()
    wait_for_mariadb()  # MariaDB가 준비될 때까지 기다림
    time.sleep(10)
    createDataBase()
    initializeMaria()
    print("##############")
    print("#   FINISH   #")
    print("##############")
