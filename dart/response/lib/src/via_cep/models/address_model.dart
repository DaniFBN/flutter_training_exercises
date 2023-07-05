class AddressModel {
  final String zipCode;
  final String street;
  final String neighborhood;
  final String state;
  final String city;
  final String complement;
  final String ibge;
  final String ddd;
  final String gia;
  final String siafi;

  const AddressModel({
    required this.zipCode,
    required this.street,
    required this.neighborhood,
    required this.state,
    required this.city,
    required this.complement,
    required this.ibge,
    required this.ddd,
    required this.gia,
    required this.siafi,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'],
      street: map['logradouro'],
      neighborhood: map['bairro'],
      city: map['localidade'],
      state: map['uf'],
      complement: map['complemento'],
      ibge: map['ibge'],
      ddd: map['ddd'],
      gia: map['gia'],
      siafi: map['siafi'],
    );
  }

  @override
  String toString() {
    return 'AddressModel(zipCode: $zipCode, street: $street, neighborhood: $neighborhood, state: $state, city: $city, complement: $complement, ibge: $ibge, ddd: $ddd, gia: $gia, siafi: $siafi)';
  }
}