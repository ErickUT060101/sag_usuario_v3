import 'package:flutter/material.dart';
import 'package:sag_usuario_v3/widgets/inicio_user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAG for Users',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('SAG for Users'),
          ),
          body: Center(child: const InicioUser())),
    );
  }
}
