import 'app_failure.dart';

class UnknownFailure extends AppFailure {
  final Object innerException;
  final StackTrace innerStackTrace;

  UnknownFailure(
    super.message, {
    super.stackTrace,
    required this.innerException,
    required this.innerStackTrace,
  });
}
