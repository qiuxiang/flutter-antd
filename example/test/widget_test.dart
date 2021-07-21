import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('test', (tester) async {
    await tester.pumpWidget(App());
  });
}
