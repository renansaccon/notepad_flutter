import 'package:flutter/material.dart';
import 'package:myapp/config/routes.dart';
import 'package:myapp/new/home.dart';
import 'package:myapp/new/new_controller.dart';
import 'package:myapp/themes/theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const Notepad());
}

class Notepad extends StatelessWidget {
  const Notepad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomePage(),
        newRoute: (context) => ChangeNotifierProvider(
            create: (context) => NewPhraseController(),
            child: newHome(),
        )
      },
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
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, savedRoute);
                },
              child: Text("Ver frases", style: TextStyle(color: newTheme.primaryColorDark),),
              style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, newRoute);
              },
              child: Text("Nova Frase", style: TextStyle(color: newTheme.primaryColorDark),),
              style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),)
          ],
        ),
      ),
    );
  }
}
