import 'package:pet_gallery/models/pet_photo_model.dart';
import 'package:pet_gallery/services/api/pet_api.dart';

class PetRepository {
  final PetApi api;

  PetRepository({required this.api});
  Future<PetPhoto> fetchPetPhotoUrl() async {
    try {
      final json = await api.fetchPetPhotoUrl();
      final data = PetPhoto.fromJson(json);
      if (data.status == "success") {
        return data;
      } else {
        throw Exception("Could not fetch data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
