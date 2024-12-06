import 'package:flutter/material.dart';
import 'package:myapp/localDB/database.dart';

class savedPhrases extends StatefulWidget {
  const savedPhrases({super.key});

  @override
  State<savedPhrases> createState() => _savedPhrasesState();
}

class _savedPhrasesState extends State<savedPhrases> {
  final database = AppDatabase();
  List<Widget> _listPhrases = [];

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    List<PhraseDataData> listItens =
      await database.select(database.phraseData).get();
      _listPhrases = listItens.map(
              (phr) => ListTile(
                title: Text(phr.phrase),
                subtitle: Text(phr.author),
              ),
      ).toList();
      setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases Salvas'),
      ),
      body:
      ListView.separated(
        key: const Key('lista'),
        itemBuilder: (context, index) => _listPhrases[index],
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: _listPhrases.length,
      ),
    );

  }
}
