import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/core/model/person.dart';
import 'package:provider_demo/core/state/bottom_navigation_bar_state.dart';
import 'package:provider_demo/core/state/person_state.dart';
import 'package:provider_demo/view/first_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      FirstPage(),
      Container(
        color: Colors.blue,
        child: Center(
          child: Text('Sayfa 2'),
        ),
      ),
    ];
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _children[
          Provider.of<BottomNavigationBarState>(context).currentIndex],
    );
  }

  Consumer<BottomNavigationBarState> _bottomNavigationBar() {
    return Consumer<BottomNavigationBarState>(
      builder: (context, state, widget) {
        return BottomNavigationBar(
          onTap: state.onTapped,
          currentIndex: state.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Home',
            ),
          ],
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Provider Demo'),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        var state = Provider.of<PersonState>(context, listen: false);
        state.add(Person('zafer', '1234'));
      },
      child: Icon(Icons.add),
    );
  }
}
