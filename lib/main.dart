import 'package:flutter/material.dart';
import 'package:flutter_application_1/route_generator.dart';
import 'package:flutter_application_1/utils/firebascontroller.dart'
    as firebaseAuth;
import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/view/news_page.dart';
import 'package:flutter_application_1/view/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  firebaseAuth.Initialing();
}

// clase principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
