import 'package:flutter/foundation.dart';

import 'package:nexqloud/features/main/models/counter.dart';

class CounterProvider with ChangeNotifier {
  final Counter _counter = Counter();

  int get counterValue => _counter.value;

  void increment() {
    _counter.value++;
    notifyListeners();
  }

  void reset() {
    _counter.value = 0;
    notifyListeners();
  }
}
