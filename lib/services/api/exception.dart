// ignore_for_file: prefer_typing_uninitialized_variables

class ApiException implements Exception {
  final message;
  final prefix;

  ApiException([this.message, this.prefix]);

  @override
  String toString() {
    return message;
  }

  String toDetailedString() {
    return "$prefix$message";
  }
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Bad Request: ");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([message]) : super(message, "Unauthorized: ");
}

class NotFoundException extends ApiException {
  NotFoundException([message]) : super(message, "Not Found: ");
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException([message])
      : super(message, "Internal Sever Error: ");
}

class JsonParsingException extends ApiException {
  JsonParsingException([message]) : super(message, "Json parsing failed: ");
}
