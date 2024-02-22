import 'package:flutter_test/flutter_test.dart';
import 'package:positiveplus/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SearchpageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
