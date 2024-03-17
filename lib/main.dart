import 'package:flutter/material.dart';
import 'package:task6/services/shared_service.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  runApp(MyApp());
}
