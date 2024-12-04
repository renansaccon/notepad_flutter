import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/config/routes.dart';
import 'package:myapp/new/home.dart';
import 'package:myapp/new/new_controller.dart';
import 'package:myapp/saved/home.dart';
import 'package:myapp/themes/theme.dart';
import 'package:provider/provider.dart';
import 'dart:async';


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
        savedRoute: (context) => savedPhrases(),
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
      backgroundColor: newTheme.primaryColorDark,
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
              style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(8),
              child: FutureBuilder<String>(
                future: _getDeviceName(),
                builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                } else if (snapshot.hasError){
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return Text('Nome do dispositivo: ${snapshot.data}');
                }
            },
            ),)
          ],
        ),
      ),
    );
  }
  static const platform = MethodChannel('com.example.device/nameDevice');

  Future<String> _getDeviceName() async {
    try {
      final String deviceName = await platform.invokeMethod('getDeviceName');
      return deviceName;
    } on PlatformException catch (e) {
      return "Erro ao obter o nome do dispositivo: ${e.message}";
    }
  }
}
