import 'package:flutter/material.dart';
import 'package:provider_demo/core/state/bottom_navigation_bar_state.dart';
import 'package:provider_demo/core/state/person_state.dart';
import 'package:provider_demo/view/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PersonState(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => BottomNavigationBarState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeView(),
      ),
    );
  }
}
