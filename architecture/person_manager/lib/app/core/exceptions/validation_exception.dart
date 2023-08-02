import 'package:person_manager/app/core/exceptions/app_exception.dart';

class ValidationException extends AppException {
  ValidationException(super.message, {super.stackTrace});
}
