// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      json['name'] as String,
      json['age'] as int,
      json['course'] as int,
      json['single'] as bool,
      (json['description'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'course': instance.course,
      'single': instance.single,
      'description': instance.description,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      groupName: json['groupName'] as String,
      course: json['course'] as int,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..amountStudents = json['amountStudents'] as int;

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'groupName': instance.groupName,
      'course': instance.course,
      'students': instance.students,
      'amountStudents': instance.amountStudents,
    };
