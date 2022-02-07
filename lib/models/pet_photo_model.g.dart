// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetPhoto _$PetPhotoFromJson(Map<String, dynamic> json) => PetPhoto(
      message: json['message'] as String? ?? "",
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$PetPhotoToJson(PetPhoto instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
