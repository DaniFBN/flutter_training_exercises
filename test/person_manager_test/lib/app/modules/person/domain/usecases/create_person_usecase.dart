import '../../../../core/failure/app_failure.dart';
import '../../../../core/failure/domain_failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/person_entity.dart';
import '../params/create_person_param.dart';
import '../repositories/i_person_repository.dart';

abstract class ICreatePersonUsecase {
  Future<Either<AppFailure, PersonEntity>> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<Either<AppFailure, PersonEntity>> call(CreatePersonParam param) async {
    final handledName = param.name.trim();
    final nameRegex = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');
    if (!nameRegex.hasMatch(handledName)) {
      return Left(DomainFailure('Nome inválido'));
    }

    if (!param.email.contains('@')) {
      return Left(DomainFailure('Email inválido'));
    }

    final handledCpf = param.cpf.trim().replaceAll(RegExp('[.-]'), '');
    final cpfRegex = RegExp(r'^[0-9]{11}$');
    if (!cpfRegex.hasMatch(handledCpf)) {
      return Left(DomainFailure('CPF inválido'));
    }

    final cpfIsValidByLogic = _validateCPF(handledCpf);
    if (!cpfIsValidByLogic) {
      return Left(DomainFailure('CPF inválido'));
    }

    final now = DateTime.now();
    final ago130Years = now.subtract(const Duration(days: 47450));
    if (param.birthAt.isBefore(ago130Years)) {
      return Left(DomainFailure('Data de nascimento inválida. Maior de 130'));
    }

    final handledPhone = param.phone.trim().replaceAll(RegExp('[ ()-]'), '');
    final phoneRegex = RegExp(r'^[0-9]{11}$');
    if (!phoneRegex.hasMatch(handledPhone)) {
      return Left(DomainFailure('Telefone inválido'));
    }

    if (param.address.street.isEmpty ||
        param.address.city.isEmpty ||
        param.address.state.isEmpty ||
        param.address.number.isEmpty) {
      return Left(DomainFailure('Endereço inválido'));
    }

    return _repository.create(param);
  }

  bool _validateCPF(String cpf) {
    final handledCpf = cpf.replaceAll(RegExp('[.-]'), '');
    final splittedCpf = handledCpf.split('').map(int.parse).toList();

    final firstStepCpf = splittedCpf.getRange(0, 9);
    int multiplier = 10;
    int sumValue = 0;
    for (final digit in firstStepCpf) {
      sumValue += digit * multiplier;

      multiplier--;
    }

    int multiplierValue = sumValue * 10;
    int rest = multiplierValue % 11;
    if (rest == 10) rest = 0;

    if (rest != splittedCpf.elementAt(9)) return false;

    final secondStepCpf = splittedCpf.getRange(0, 10);
    multiplier = 11;
    sumValue = 0;
    for (final digit in secondStepCpf) {
      sumValue += digit * multiplier;

      multiplier--;
    }

    multiplierValue = sumValue * 10;
    rest = multiplierValue % 11;
    if (rest == 10) rest = 0;

    if (rest != splittedCpf.elementAt(10)) return false;

    return true;
  }
}
