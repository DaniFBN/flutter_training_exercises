import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../cubit/persons_cubit.dart';
import '../cubit/state/persons_state.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({
    Key? key,
    required this.personsCubit,
  }) : super(key: key);

  final PersonsCubit personsCubit;

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  @override
  void initState() {
    super.initState();

    widget.personsCubit.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),
      body: BlocBuilder(
        bloc: widget.personsCubit,
        builder: (_, PersonsState state) {
          switch (state) {
            case LoadingPersonsState():
              return const Center(child: CircularProgressIndicator());
            case FailurePersonsState():
              return Center(child: Text(state.failure.message));
            case DataPersonsState():
              if (state.persons.isEmpty) {
                return const Center(child: Text('Cadastre uma pessoa'));
              }
              return ListView.builder(
                itemCount: state.persons.length,
                itemBuilder: (_, index) {
                  final person = state.persons.elementAt(index);

                  return Card(
                    child: ListTile(
                      title: Text(person.name),
                      subtitle: Text(person.email),
                    ),
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/person/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
