import 'package:ejem/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'screens/task_calendar_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/main_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
        initialRoute: '/main_center',
      routes: {
        '/main_center': (context) => MainCenter(),
        '/task_calendar': (context) => TaskCalendarScreen(),
        '/user_profile': (context) => UserProfileScreen(),
        // Agrega aquí otras rutas si es necesario
      },
    );
  }
}
