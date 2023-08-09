import 'package:person_manager_clean_arch_2/app/core/exceptions/app_exception.dart';
import 'package:person_manager_clean_arch_2/app/core/validators/email_validator_mixin.dart';
import 'package:person_manager_clean_arch_2/app/core/value_objects/name_vo.dart';

import '../../../../core/exceptions/validation_exception.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/value_objects/email_vo.dart';

class CreatePersonParam with EmailValidatorMixin {
  final NameVO name;
  final String cpf;
  final DateTime birth;
  final EmailVO? email;

  const CreatePersonParam({
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });

  Result<Unit, AppException> validate() {
    if (name.hasError) {
      return Result.failure(ValidationException(name.error!));
    }

    final handledCpf = cpf.replaceAll(RegExp('[.-]'), '');
    if (handledCpf.length != 11) {
      return Result.failure(ValidationException('O cpf deve ter 11 dígitos'));
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (birth.isAfter(eighteenYearsAgo)) {
      return Result.failure(ValidationException('Deve ser maior de 18 anos'));
    }

    final validEmail = validateEmail(email?.value ?? '');
    if (validEmail != null) {
      return Result.failure(ValidationException(email!.error!));
    }

    return Result.success(unit);
  }
}
