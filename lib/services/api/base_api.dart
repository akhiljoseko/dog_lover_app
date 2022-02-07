import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_gallery/services/api/exception.dart';

class BaseApi {
  Future<dynamic> get<T>(
    String endPoint,
    dynamic body, {
    String contentType = "",
  }) async {
    const baseUrl = "https://dog.ceo/api/";
    final url = baseUrl + endPoint;
    final response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json; charset=UTF-8"});
    return _getResponse(response);
  }

  _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
      case 204:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
      default:
        throw InternalServerErrorException(response.body.toString());
    }
  }
}
