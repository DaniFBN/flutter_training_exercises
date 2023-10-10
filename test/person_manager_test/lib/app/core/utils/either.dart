// export 'package:result_dart/result_dart.dart';
// export 'package:fpdart/fpdart.dart';
// export 'package:dartz/dartz.dart';

sealed class Either<Failure, Success> {
  factory Either.left(Failure value) => Left<Failure, Success>(value);
  factory Either.right(Success value) => Right<Failure, Success>(value);

  T fold<T>(
    T Function(Failure left) onLeft,
    T Function(Success right) onRight,
  );
}

class Left<Failure, Success> implements Either<Failure, Success> {
  final Failure _value;

  const Left(this._value);

  @override
  T fold<T>(
    T Function(Failure left) onLeft,
    T Function(Success right) onRight,
  ) {
    return onLeft(_value);
  }
}

class Right<Failure, Success> implements Either<Failure, Success> {
  final Success _value;

  const Right(this._value);

  @override
  T fold<T>(
    T Function(Failure left) onLeft,
    T Function(Success right) onRight,
  ) {
    return onRight(_value);
  }
}

typedef AsyncEither<F, S> = Future<Either<F, S>>;

T id<T>(T value) => value;
