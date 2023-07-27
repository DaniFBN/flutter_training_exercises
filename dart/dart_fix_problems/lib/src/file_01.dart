void file01() {
  final users = data.map(UserModel.fromMap);

  for (final user in users) {
    print(user.name!);
    print(user.email!);
    print(user.age!);
  }
}

class UserModel {
  final String? name;
  final String? email;
  final int? age;

  const UserModel({
    required this.name,
    required this.email,
    required this.age,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      age: map['age'],
    );
  }
}

final data = [
  {'name': 'Daniel Fernandes', 'email': 'daniel.noronha@fteam.dev', 'age': 23},
  {'name': 'Daniel Fernandes', 'email': 'daniel.noronha@fteam.dev'},
];
