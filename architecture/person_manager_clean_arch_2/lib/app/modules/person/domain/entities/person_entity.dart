import 'package:person_manager_clean_arch_2/app/core/value_objects/name_vo.dart';

import '../../../../core/value_objects/email_vo.dart';

class PersonEntity {
  final String id;
  final NameVO name;
  final String cpf;
  final DateTime birth;
  final EmailVO? email;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });
}
