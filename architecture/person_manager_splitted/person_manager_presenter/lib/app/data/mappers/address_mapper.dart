import '../../domain/entities/address_entity.dart';

abstract class AddressMapper {
  static Map<String, dynamic> toMap(AddressEntity address) {
    return {
      'city': address.city,
      'state': address.state,
      'street': address.street,
      'number': address.number,
    };
  }

  static AddressEntity fromMap(Map<String, dynamic> data) {
    return AddressEntity(
      street: data['street'],
      state: data['state'],
      city: data['city'],
      number: data['number'],
    );
  }
}
