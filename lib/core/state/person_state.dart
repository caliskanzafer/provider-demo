import 'package:flutter/cupertino.dart';
import 'package:provider_demo/core/model/person.dart';

class PersonState with ChangeNotifier {
  List<Person> _persons = [Person('zafer', '111')];

  List<Person> get persons => _persons;

  add(Person person) {
    _persons.add(person);
    notifyListeners();
  }

  delete(Person person) {
    _persons.remove(person);
    notifyListeners();
  }
}
