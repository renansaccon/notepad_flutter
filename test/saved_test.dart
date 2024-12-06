import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/saved/home.dart';

void main(){
  group('Verifica abertura de lista', ()
  {
    testWidgets('Deve ter uma lista gerada', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: savedPhrases(),
      ),
      );

      final listaKey = find.byKey(Key('lista'));

      expect(listaKey, findsOneWidget);

    },
    );
  },
  );
}
