// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'address_entity.dart';

class PersonEntity {
  final int id;
  final String name;
  final String cpf;
  final DateTime birthAt;
  final String email;
  final String phone;
  final AddressEntity address;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.email,
    required this.phone,
    required this.address,
  });

  PersonEntity copyWith({
    int? id,
    String? name,
    String? cpf,
    DateTime? birthAt,
    String? email,
    String? phone,
    AddressEntity? address,
  }) {
    return PersonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      birthAt: birthAt ?? this.birthAt,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
