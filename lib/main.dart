import 'package:flutter/material.dart';
import 'package:kindershala/features/splash/splash.dart';
import 'package:kindershala/providers/appProvider.dart';
import 'package:kindershala/utils/strings.dart';
import 'package:kindershala/utils/routes.dart';
import 'package:kindershala/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: theme(),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      initialRoute: Splash.routeName,
      routes: routes,
    );
  }
}
