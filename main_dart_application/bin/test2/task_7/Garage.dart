enum Object {
  car,
  bicycle,
  bike,
  babyStroller
}

class ObjectTransport {
  static late int size;
}

class Car1 implements ObjectTransport {
  @override
  static int size = 8;
}

class Bicycle implements ObjectTransport {
  @override
  static int size = 2;
}

class Bike implements ObjectTransport {
  @override
  static int size = 4;
}

class BabyStroller implements ObjectTransport {
  @override
  static int size = 1;
}

class Garage<T extends ObjectTransport, P extends ObjectTransport> {
  late int maxSize;
  late List<P> objects = [];

  Garage(List<P> objects) {
    maxSize = getTSize(T);
    int pSize = getTSize(P);

    for (P element in objects) {
      if (maxSize >= this.objects.length * pSize + pSize) this.objects.add(element);
    }

    print(this.objects);
  }

  int getTSize(Type type) {
    switch(type) {
      case Car1:
        return Car1.size;
      case Bicycle:
        return Bicycle.size;
      case Bike:
        return Bike.size;
      case BabyStroller:
        return BabyStroller.size;
      default:
        return 0;
    }
  }
}