class Thing {
  String name;
  double weight;
  double size;

  Thing(this.name, this.weight, this.size);

  Map<String, dynamic> toJson() {
    return {
      'name' : {'weight' : weight, 'size' : size}
    };
  }
}

class Wardrobe {
  List<Thing> things = [];

  Wardrobe(this.things);
}