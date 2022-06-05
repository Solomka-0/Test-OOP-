abstract class Cutlery {
  String className = 'Cтоловый прибор';
  late String name;

  Cutlery(this.name);

  @override
  String toString() => '$className "$name"';

  String toDo() => 'Делает что-то';
}

class Fork extends Cutlery {
  String className = 'Вилка';

  Fork(super.name);

  @override
  String toDo() => 'Тыкает во что-то';
}

class Spoon extends Cutlery {
  String className = 'Ложка';

  Spoon(super.name);

  @override
  String toDo() => 'Набирает чего-то';
}

class Knife extends Cutlery {
  String className = 'Нож';

  Knife(super.name);

  @override
  String toDo() => 'Разрезает что-то';
}