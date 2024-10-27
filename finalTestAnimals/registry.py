class Registry:
    def __init__(self):
        self.animals = []

    def add_animal(self, animal):
        self.animals.append(animal)

    def show_registry(self):
        for animal in self.animals:
            print(f"Имя: {animal.name}, Дата рождения: {animal.birth_date}, Тип: {animal.animal_type}, Команды: {', '.join(animal.get_commands())}")

