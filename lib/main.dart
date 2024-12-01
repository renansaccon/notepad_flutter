import 'package:flutter/material.dart';
import 'package:myapp/themes/theme.dart';

void main() {
  runApp(const Notepad());
}

class Notepad extends StatelessWidget {
  const Notepad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

  class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerador de Frases"),titleTextStyle: TextStyle(color: newTheme.primaryColorDark, fontSize: 20),
      centerTitle: true,
      backgroundColor: newTheme.primaryColor,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Ver frases", style: TextStyle(color: newTheme.primaryColorDark),), style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),//navegar para a rota
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){}, child: Text("Nova Frase", style: TextStyle(color: newTheme.primaryColorDark),), style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),)
          ],
        ),
      ),
    );
  }
}
