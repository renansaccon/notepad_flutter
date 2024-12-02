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

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);
    var logger = Logger();
    
    
    return Scaffold(
      appBar: AppBar(title: Text("Gerar nova frase"),titleTextStyle: TextStyle(color: newTheme.primaryColorDark, fontSize: 20),
        centerTitle: true,
        backgroundColor: newTheme.primaryColor,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: "Clique em GERAR UMA NOVA FRASE"
              ),
            ),
            ElevatedButton(
              onPressed:(){
                Provider.of<NewPhraseController>(context, listen: false).generatePhrase();
              },
              child: Text("Gerar nova frase", style: TextStyle(color: newTheme.primaryColorDark)),
              style: ElevatedButton.styleFrom(backgroundColor: newTheme.secondaryHeaderColor),//navegar para a rota
            ),
            Consumer<NewPhraseController>(
                builder: (context, value, child){
                  return
                    Text('${value.phrase.toString()} Autor: ${value.author.toString()}');
                }
            )
          ],
        ),
      ),
    );
  }
}
