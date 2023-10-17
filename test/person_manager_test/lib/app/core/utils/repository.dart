import '../failure/app_failure.dart';
import '../failure/unknown_failure.dart';
import 'either.dart';

typedef CustomAsyncCallback<T> = Future<T> Function();

abstract class Repository {
  const Repository();

  Future<Either<AppFailure, T>> execute<T>({
    required CustomAsyncCallback<T> callback,
  }) async {
    try {
      final value = await callback();
      return Right(value);
    } on AppFailure catch (e) {
      return Left(e);
    } catch (e, s) {
      final failure = UnknownFailure(
        'Aconteceu um erro. Tente novamente.',
        innerException: e,
        innerStackTrace: s,
      );

      return Left(failure);
    }
  }
}
