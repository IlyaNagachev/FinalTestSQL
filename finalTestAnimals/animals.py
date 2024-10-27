class Animal:
    def __init__(self, name, birth_date, animal_type, commands):
        self.name = name
        self.birth_date = birth_date
        self.animal_type = animal_type
        self.commands = commands

    def add_command(self, command):
        self.commands.append(command)

    def get_commands(self):
        return self.commands


class Pet(Animal):
    def __init__(self, name, birth_date, commands):
        super().__init__(name, birth_date, "домашнее", commands)


class PackAnimal(Animal):
    def __init__(self, name, birth_date, commands):
        super().__init__(name, birth_date, "вьючное", commands)

