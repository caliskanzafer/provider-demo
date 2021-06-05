import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/core/state/person_state.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonState>(
      builder: (context, state, widget) {
        var persons = state.persons;
        return ListView.builder(
          itemBuilder: (context, index) {
            var person = persons[index];
            return ListTile(
              title: Text('${person.name}'),
              subtitle: Text('${person.phoneNumber}'),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<PersonState>(context, listen: false)
                        .delete(person);
                  },
                  icon: Icon(Icons.delete)),
            );
          },
          itemCount: state.persons.length,
        );
      },
    );
  }
}
