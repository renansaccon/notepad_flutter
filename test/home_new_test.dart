import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/new/home.dart';
import 'package:myapp/new/new_controller.dart';
import 'package:provider/provider.dart';


void main() {
  group('Testa SnackBar',() {
    testWidgets('Deve resultar em um SnackBar ao clicar em salvar',
            (tester) async {
      final controller = NewPhraseController();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<NewPhraseController>(
              create: (_) => controller,
            ),
          ],
          child: MaterialApp(
            home: newHome(), // Substitua com seu widget de teste
          ),
        ),
      );

      final salvarBotao = find.byKey(const Key('salvar_botao_key'));
      await tester.tap(salvarBotao);
      await tester.pumpAndSettle();

      expect(find.text('Frase salva com sucesso'), findsOneWidget);
    });
  });

  group('Testa retorno gerar', () {
    testWidgets('Deve retornar a consulta realizar',
        (tester) async {
          final controller = NewPhraseController();
          await tester.pumpWidget(
            MultiProvider(
              providers: [
                ChangeNotifierProvider<NewPhraseController>(
                  create: (_) => controller,
                ),
              ],
              child: MaterialApp(
                home: newHome(), // Substitua com seu widget de teste
              ),
            ),
          );
          final Consumer_key = find.byKey(const Key('Consumer_key'));
          final gerarBotao = find.byKey(const Key('gerar_frase_key'));
          await tester.tap(gerarBotao);
          await tester.pumpAndSettle();

          expect(Consumer_key, findsOne);

        },
    );
  }

  );
}