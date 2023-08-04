import 'package:flutter/material.dart';
import 'package:dashboard_app/widget_tree.dart';
import 'package:dashboard_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print(MyClass(name: "soufiane"));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
      ),
      home:  WidgetTree(),
    );
  }
}

class MyClass {
  String name;
  MyClass({required this.name});
}
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MyClass person1 = MyClass("soufiane");
//      print(MyClass.staticVariable);
//      print(person1.name);
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
