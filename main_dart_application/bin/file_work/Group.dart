// student.dart
import 'package:json_annotation/json_annotation.dart';

part 'Group.g.dart';

@JsonSerializable()
class Student {
  final String name;
  late int age;
  late int course;
  late bool single;
  @JsonKey(name: 'description')
  List<String>? _descriptionList = [];
  Student(this.name, this.age, this.course,
      this.single, List<String>? description){
    _descriptionList = description;
  }
  Student.withOutDescription(
      {required this.name,
        required this.age,
        required this.course,
        required this.single});
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
  List<String> get description{
    return _descriptionList ?? <String>[];
  }
  void addDescription(String description) {
    _descriptionList?.add(description);
  }
  void addAllDescriptions(List<String> descriptions) {
    _descriptionList?.addAll(descriptions);
  }
  @override
  String toString() {
    var student = 'Студент {имя: $name, возраст: $age, ';
    student += 'курс: $course, холост: $single, ';
    student += 'описание: $_descriptionList}';
    return student;
  }
}

@JsonSerializable()
class Group{
  final String groupName;
  late int course;
  List<Student>? students = [];
  Group({required this.groupName,
    required this.course, this.students});
  Group.emptyGroup({required this.groupName,
    required this.course});
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @JsonKey(name: 'amountStudents')
  int amountStudents = 0;

   void setAmount(){
    amountStudents = students?.length ?? 0;
  }
  void addStudent(Student student){
    students?.add(student);
    setAmount();
  }
  void addAllStudents(List<Student> students){
    this.students?.addAll(students);
    setAmount();
  }
  @override
  String toString() {
    var groupInfo = 'Группа: $groupName \nкурс: $course\n';
    groupInfo += 'кол-во студентов: $amountStudents \nсписок: [ \n';
    students?.forEach((element) {
      groupInfo += '$element \n';
    });
    groupInfo += ']';
    return groupInfo;
  }
}