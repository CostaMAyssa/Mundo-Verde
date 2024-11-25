import 'package:flutter/material.dart';
import 'package:mundo_verde/telas/cadastro_screen.dart';


void main() {
  runApp(const MundoVerdeApp());
}

class MundoVerdeApp extends StatelessWidget {
  const MundoVerdeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastroScreen(),
    );
  }
}
