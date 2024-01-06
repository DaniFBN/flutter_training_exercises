import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager_list/app/modules/person/domain/entities/person_entity.dart';

import '../cubit/persons_cubit.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final Persons2Cubit cubit;

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  @override
  void initState() {
    super.initState();

    widget.cubit.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persons')),
      body: BlocBuilder(
          bloc: widget.cubit,
          builder: (context, List<PersonEntity> state) {
            // switch (state) {
            //   case LoadingPersonsState():
            //     return const Center(child: CircularProgressIndicator());
            //   case FailurePersonsState():
            //     return Center(child: Text(state.failure.message));
            //   case DataPersonsState():
            return ListView.separated(
              itemCount: state.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) {
                final person = state.elementAt(index);

                return ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.email),
                );
              },
            );
          }
          // },
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
