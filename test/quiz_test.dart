import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/main.dart';

void main() {
  testWidgets('small screen, double taps score once, must answer to finish',
      (tester) async {
    tester.view.physicalSize = const Size(320, 480); // small phone
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MainApp());

    for (final q in questions) {
      await tester.tap(find.byIcon(Icons.forward)); // unanswered: no-op
      await tester.pump();
      expect(find.text(q.text), findsOneWidget);

      final correct = find.textContaining(q.options[q.correctIndex]);
      await tester.ensureVisible(correct);
      await tester.tap(correct);
      await tester.tap(correct); // second tap must not add a point
      await tester.pump();
      await tester.tap(find.byIcon(Icons.forward));
      await tester.pumpAndSettle();
    }

    expect(find.text("Score : ${questions.length} / ${questions.length}"),
        findsOneWidget);
  });
}
