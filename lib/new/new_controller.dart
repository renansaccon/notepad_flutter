import 'package:flutter/material.dart';
import 'package:myapp/model/new_phrase.dart' as model;
import 'package:dio/dio.dart';
import 'package:myapp/new/home.dart';

import '../retrofit/rest_client.dart';

class NewPhraseController extends ChangeNotifier{
  String? phrase = "";
  String? author = "";

  void generatePhrase() async {
    try {
      final dio = Dio();
      final client = RestClient(dio);
      final List<model.NewModelPhrase> response = await client.getNewPhrase();

      if (response.isNotEmpty) {
        phrase = response[0].q;
        author = response[0].a;
        notifyListeners();
      }
    }
    catch (e){
      print("Erro ao gerar a frase: $e");
    }

  }
}