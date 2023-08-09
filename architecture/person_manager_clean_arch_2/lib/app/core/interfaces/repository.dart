import 'package:flutter/material.dart';

import '../exceptions/app_exception.dart';
import '../utils/result.dart';

abstract class Repository {
  const Repository();

  @protected
  AsyncResult<S, AppException> execute<S extends Object>(
    AsyncResult<S, AppException> Function() callback,
  ) async {
    try {
      return await callback();
    } on AppException catch (e) {
      return Result.failure(e);
    }
  }
}
