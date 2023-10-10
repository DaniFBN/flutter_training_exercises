import 'app_failure.dart';

class UnknownFailure extends AppFailure {
  final Object innerException;
  final StackTrace innerStackTrace;

  UnknownFailure(
    super.message, {
    required this.innerException,
    required this.innerStackTrace,
    super.stackTrace,
    super.label,
  });
}
