import 'package:flutter_test/flutter_test.dart';
import 'package:dart_flutter_learning_lab/core/app.dart';
void main() { testWidgets('Learning Lab starts', (tester) async { await tester.pumpWidget(const LearningLabApp()); expect(find.text('Learning Lab'), findsWidgets); }); }
