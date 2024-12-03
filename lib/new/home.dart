import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/new/new_controller.dart';
import 'package:myapp/retrofit/rest_client.dart';
import 'package:provider/provider.dart';
import 'package:myapp/model/new_phrase.dart' as model;

import '../themes/theme.dart';

class newHome extends StatelessWidget {
  newHome({super.key});
  bool isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Gerar nova frase"),titleTextStyle: TextStyle(color: newTheme.primaryColorDark, fontSize: 20),
        centerTitle: false,
        backgroundColor: newTheme.primaryColor,),
      backgroundColor: newTheme.primaryColorDark,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NewPhraseController>(
                builder: (context, value, child){
                  return
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: newTheme.primaryColor
                    ),
                    child: Text('Frase: ${value.phrase.toString()} \n \n Autor: ${value.author.toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          color: newTheme.primaryColorDark,
                          letterSpacing: (0.3)),),
                  );
                }
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: isButtonEnabled ? (){
                Provider.of<NewPhraseController>(context, listen: false).generatePhrase();
                isButtonEnabled = false;
              }:null,
              child: Text("Gerar nova frase", style: TextStyle(color: newTheme.primaryColorDark)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: newTheme.secondaryHeaderColor,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),),//navegar para a rota
            ),
            SizedBox(height: 20,),
            OutlinedButton(
                onPressed: (){},
                child: Text("Salvar frase"),style: OutlinedButton.styleFrom(
                    foregroundColor: newTheme.primaryColor,
                    side: BorderSide(color: newTheme.primaryColor),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40)),)
          ],
        ),
      ),
    );
  }
}
