// export 'package:fpdart/fpdart.dart';

typedef AsyncEither<F, S> = Future<Either<F, S>>;

sealed class Either<F, S> {
  factory Either.left(F value) => Left(value);
  factory Either.right(S value) => Right(value);

  T fold<T>(T Function(F) onLeft, T Function(S) onRight);
}

class Left<F, S> implements Either<F, S> {
  final F _value;

  const Left(this._value);

  @override
  T fold<T>(T Function(F p1) onLeft, T Function(S p1) onRight) {
    return onLeft(_value);
  }
}

class Right<F, S> implements Either<F, S> {
  final S _value;

  const Right(this._value);

  @override
  T fold<T>(T Function(F p1) onLeft, T Function(S p1) onRight) {
    return onRight(_value);
  }
}
