class Student {
  String name;
  int age;
  int course;

  Student(this.name, this.age, this.course);

  static Student fromJson(Map <String, dynamic> json){
    return Student(json['name'], json['age'] , json['course']);
  }

  Map <String, dynamic> toJson() {
    return {
      'name' : this.name,
      'age' : this.age,
      'course' : this.course
    };
  }

  String toString() {
    return 'Студент $name\n - $age лет, $course курс';
  }
}