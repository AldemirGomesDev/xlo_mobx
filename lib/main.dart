import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';
import 'stores/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
      "AiGAO2IZ5xEhLxElY1j6FX7jrXPwrXM38UHu0cz4",
      "https://parseapi.back4app.com/",
      clientKey: "QBqJnHherzgUA7KW7ny2ugdARjAEG38eBR7Y2ysg",
      autoSendSessionId: true ,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        cursorColor: Colors.orange,
      ),
      home: BaseScreen(),
    );
  }
}
