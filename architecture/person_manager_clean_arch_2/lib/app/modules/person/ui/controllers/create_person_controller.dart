import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager_clean_arch_2/app/core/value_objects/name_vo.dart';

import '../../../../core/interfaces/facade.dart';
import '../../../../core/services/snack_bar/i_snack_bar_service.dart';
import '../../../../core/value_objects/email_vo.dart';
import '../../domain/params/create_person_param.dart';
import '../../domain/stores/create_person_store.dart';
import '../../domain/stores/events/create_person_event.dart';
import '../../domain/stores/events/persons_event.dart';
import '../../domain/stores/persons_store.dart';
import '../../domain/stores/states/create_person_state.dart';

class CreatePersonController extends Facade {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Daniel A');
  final cpfController = TextEditingController(text: '12312312312');
  final emailController = TextEditingController(text: 'dev@fteam.dev');
  final birthController = TextEditingController(
    text: '1995-07-12 00:00:00.000',
  );

  late final StreamSubscription _createStoreSubscription;
  final CreatePersonStore createStore;
  final PersonsStore _personsStore;
  final ISnackBarService _snackBarService;

  CreatePersonController({
    required this.createStore,
    required PersonsStore personsStore,
    required ISnackBarService snackBarService,
  })  : _personsStore = personsStore,
        _snackBarService = snackBarService {
    _createStoreSubscription = createStore.stream.listen(_storeListener);
  }

  void create() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    EmailVO? email;
    if (emailController.text.isNotEmpty) {
      email = EmailVO(emailController.text);
    }

    final param = CreatePersonParam(
      name: NameVO(nameController.text),
      cpf: cpfController.text,
      birth: DateTime.parse(birthController.text),
      email: email,
    );

    createStore.add(SubmitCreatePersonEvent(param));
  }

  void _storeListener(CreatePersonState state) {
    if (state is ErrorCreatePersonState) {
      final snackBar = SnackBar(content: Text(state.exception.message));
      _snackBarService.showSnackBar(snackBar);
    } else if (state is SuccessCreatePersonState) {
      const snackBar = SnackBar(content: Text('Cadastrado com sucesso'));
      _snackBarService.showSnackBar(snackBar);

      _personsStore.add(const GetPersonsEvent());
      Modular.to.pop();
    }
  }

  @override
  void dispose() {
    _createStoreSubscription.cancel();
  }
}
