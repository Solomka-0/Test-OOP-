// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Wardrobe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thing _$ThingFromJson(Map<String, dynamic> json) => Thing(
      json['name'] as String,
      (json['weight'] as num).toDouble(),
      (json['size'] as num).toDouble(),
    );

Map<String, dynamic> _$ThingToJson(Thing instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'size': instance.size,
    };
