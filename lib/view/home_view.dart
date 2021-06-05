import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/core/model/person.dart';
import 'package:provider_demo/core/state/person_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var state = Provider.of<PersonState>(context, listen: false);
          state.add(Person('zafer', '1234'));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<PersonState>(
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
      ),
    );
  }
}
