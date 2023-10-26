import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/widgets/custom_progress_indicator.dart';

import '../cubit/persons_cubit.dart';
import '../cubit/state/persons_state.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final PersonsCubit cubit;

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
        builder: (context, PersonsState state) {
          switch (state) {
            case LoadingPersonsState():
              return const Center(child: CustomProgressIndicator());
            case FailurePersonsState():
              return Center(
                child: Text(
                  state.failure.message,
                  key: const ValueKey('FAILURE-MESSAGE'),
                ),
              );
            case DataPersonsState():
              return ListView.separated(
                itemCount: state.persons.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final person = state.persons.elementAt(index);

                  return ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.email),
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
