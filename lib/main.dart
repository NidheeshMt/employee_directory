import 'package:employee_directory/redux/store.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var store = await createStore();
  runApp(App(store: store));
}
