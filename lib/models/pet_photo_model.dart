import 'package:json_annotation/json_annotation.dart';

part 'pet_photo_model.g.dart';

@JsonSerializable()
class PetPhoto {
  final String message;
  final String status;

  PetPhoto({this.message = "", this.status = ""});

  factory PetPhoto.fromJson(Map<String, dynamic> json) =>
      _$PetPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PetPhotoToJson(this);
}
