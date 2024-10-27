import pymysql
from config import host, user, password, db_name

try:
  connection = pymysql(
    host=host,
    port=3306,
    user="root",
    password="qwerty",
    database="друзья_человека",
    cursorclass=pymysql.cursors.DictCursor
  )
  print("successfully connected...")

except Exception as ex:
  print("Connection refused...")
  print(ex)


from animals import Pet, PackAnimal
from registry import Registry

def main():
    registry = Registry()

    while True:
        print("1. Завести новое животное")
        print("2. Показать реестр животных")
        print("3. Выйти")

        choice = input("Выберите действие: ")

        if choice == "1":
            name = input("Введите имя животного: ")
            birth_date = input("Введите дату рождения (YYYY-MM-DD): ")
            animal_type = input("Введите тип (домашнее/вьючное): ")
            commands = input("Введите команды через запятую: ").split(',')

            if animal_type == "домашнее":
                animal = Pet(name, birth_date, commands)
            else:
                animal = PackAnimal(name, birth_date, commands)

            registry.add_animal(animal)

        elif choice == "2":
            registry.show_registry()

        elif choice == "3":
            break

if __name__ == "__main__":
    main()
