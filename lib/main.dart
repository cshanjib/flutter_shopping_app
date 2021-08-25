import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/injectable/config.dart';
import 'package:flutter_shopping_app/ui/dashboard/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ThemeWhite,
      ),
      home: Scaffold(
        body: Dashboard(),
        appBar: AppBar(
          title: Text("Shopping App"),
          centerTitle: false,
        ),
      ),
    );
  }
}
