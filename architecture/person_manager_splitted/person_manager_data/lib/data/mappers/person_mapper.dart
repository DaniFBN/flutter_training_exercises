import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import 'address_mapper.dart';

abstract class PersonMapper {
  static Map<String, dynamic> createToMap(CreatePersonParam param) {
    return {
      'name': param.name,
      'cpf': param.cpf,
      'email': param.email,
      'phone': param.phone,
      'birth_at': param.birthAt.millisecondsSinceEpoch,
      'address': AddressMapper.toMap(param.address),
    };
  }

  static PersonEntity fromMap(Map<String, dynamic> data) {
    return PersonEntity(
      id: data['id'],
      name: data['name'],
      cpf: data['cpf'],
      birthAt: DateTime.fromMillisecondsSinceEpoch(data['birth_at']),
      email: data['email'],
      phone: data['phone'],
      address: AddressMapper.fromMap(data['address']),
    );
  }
}
