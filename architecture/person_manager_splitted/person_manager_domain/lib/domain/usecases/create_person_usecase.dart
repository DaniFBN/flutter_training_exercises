import '../entities/person_entity.dart';
import '../params/create_person_param.dart';
import '../repositories/i_person_repository.dart';

abstract class ICreatePersonUsecase {
  Future<PersonEntity> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<PersonEntity> call(CreatePersonParam param) {
    final handledName = param.name.trim();
    final nameRegex = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');
    if (!nameRegex.hasMatch(handledName)) {
      throw Exception('Nome inválido');
    }

    if (!param.email.contains('@')) {
      throw Exception('Email inválido');
    }

    final handledCpf = param.cpf.trim().replaceAll('[.-]', '');
    final cpfRegex = RegExp(r'^[0-9]{11}$');

    final cpfIsValidByRegex = cpfRegex.hasMatch(handledCpf);
    final cpfIsValidByLogic = _validateCPF(handledCpf);
    if (!cpfIsValidByRegex && !cpfIsValidByLogic) {
      throw Exception('CPF inválido');
    }

    final now = DateTime.now();
    final ago130Years = now.subtract(const Duration(days: 47450));
    if (param.birthAt.isBefore(ago130Years)) {
      throw Exception('Data de nascimento inválida. Maior de 130');
    }

    final handledPhone = param.phone.trim().replaceAll('[()- ]', '');
    final phoneRegex = RegExp(r'^[0-9]{11}$');
    if (!phoneRegex.hasMatch(handledPhone)) {
      throw Exception('Telefone inválido');
    }

    if (param.address.street.isEmpty ||
        param.address.city.isEmpty ||
        param.address.state.isEmpty ||
        param.address.number.isEmpty) {
      throw Exception('Endereço inválido');
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
