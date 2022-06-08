
import 'package:json_annotation/json_annotation.dart';

part 'Wardrobe.g.dart';

@JsonSerializable()
class Thing {
  @JsonKey(name: 'name')
  String name;
  double weight;
  double size;

  Thing(this.name, this.weight, this.size);

  Map<String, dynamic> toJson() => _$ThingToJson(this);
}

class Wardrobe {
  List<Thing> things = [];

  Wardrobe(this.things);

}