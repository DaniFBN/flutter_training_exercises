import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/address_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../cubit/add_person_cubit.dart';
import '../cubit/state/add_person_state.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final AddPersonCubit cubit;

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'TESTE 2');
  final emailController = TextEditingController(text: 'dani.noronha@fteam.dev');
  final phoneController = TextEditingController(text: '(11) 1234-12345');
  final cpfController = TextEditingController(text: '330.786.970-10');
  final birthAtController = TextEditingController(text: '1999-12-12');
  late final StreamSubscription cubitSubscription;

  @override
  void initState() {
    super.initState();

    cubitSubscription = widget.cubit.stream.listen(
      (event) {
        if (event is SuccessAddPersonState) {
          showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                child: Center(
                  child: Text('Deu certo'),
                ),
              );
            },
          );
        } else if (event is FailureAddPersonState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(event.message)),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    cubitSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Person')),
      body: Column(
        children: [
          BlocBuilder<AddPersonCubit, AddPersonState>(
            bloc: widget.cubit,
            builder: (context, state) {
              switch (state) {
                case LoadingAddPersonState():
                  return const LinearProgressIndicator();
                default:
                  return const SizedBox();
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: birthAtController,
                      decoration: const InputDecoration(
                        labelText: 'Data de nascimento',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: cpfController,
                      decoration: const InputDecoration(labelText: 'CPF'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(labelText: 'Telefone'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) return;

                        final birthAt =
                            DateTime.tryParse(birthAtController.text) ??
                                DateTime.now();

                        final param = CreatePersonParam(
                          name: nameController.text,
                          birthAt: birthAt,
                          cpf: cpfController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          address: const AddressEntity(
                            street: 'Rua Whatever',
                            number: '23',
                            city: 'São Paulo',
                            state: 'SP',
                          ),
                        );

                        widget.cubit.create(param);
                      },
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

