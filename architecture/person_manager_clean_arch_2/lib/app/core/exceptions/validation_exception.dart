import 'app_exception.dart';

class ValidationException extends AppException {
  ValidationException(super.message, {super.stackTrace});
}
