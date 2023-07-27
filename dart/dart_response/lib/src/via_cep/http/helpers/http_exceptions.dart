class AppHttpException implements Exception {
  const AppHttpException();
}

class NotFoundException extends AppHttpException {
  const NotFoundException();
}

class BadRequestException extends AppHttpException {
  const BadRequestException();
}
