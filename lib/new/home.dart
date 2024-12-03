import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/localDB/database.dart';
import 'package:myapp/new/new_controller.dart';
import 'package:myapp/retrofit/rest_client.dart';
import 'package:provider/provider.dart';
import 'package:myapp/model/new_phrase.dart' as model;
import 'package:fluttertoast/fluttertoast.dart';

import '../themes/theme.dart';

class newHome extends StatelessWidget {
  newHome({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();
    var author = "";
    var phrase= "";

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
                  phrase = value.phrase.toString();
                  author = value.author.toString();
                  return
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: newTheme.primaryColor
                    ),
                    child: Text('Frase: $phrase \n \n Autor: $author',
                      style: TextStyle(
                          fontSize: 20,
                          color: newTheme.primaryColorDark,
                          letterSpacing: (0.3),
                      ),
                    ),
                  );
                },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Provider.of<NewPhraseController>(context, listen: false).generatePhrase();
              },
              child: Text("Gerar nova frase", style: TextStyle(color: newTheme.primaryColorDark)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: newTheme.secondaryHeaderColor,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),),//navegar para a rota
            ),
            SizedBox(height: 20,),
            OutlinedButton(
                onPressed: (){
                  database
                      .into(database.phraseData)
                      .insert(PhraseDataCompanion.insert(
                        phrase: phrase,
                        author: author));
                  Fluttertoast.showToast(msg: "Frase salva",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color.fromRGBO(3, 169, 244, 50),
                  textColor: newTheme.primaryColorDark,
                  fontSize: 16.0,
                  );
                  Navigator.pop(context);
                },
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
