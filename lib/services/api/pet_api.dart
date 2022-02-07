import 'package:pet_gallery/services/api/base_api.dart';

class PetApi extends BaseApi {
  Future<dynamic> fetchPetPhotoUrl() async {
    const endPoint = "breeds/image/random";
    return await get(endPoint, "");
  }
}
