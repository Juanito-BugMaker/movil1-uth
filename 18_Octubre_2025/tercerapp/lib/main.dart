import 'package:flutter/material.dart';
import 'src/pages/home_page.dart';
import 'src/pages/add_user_page.dart';
import 'src/pages/update_user_page.dart';
import 'src/pages/view_users_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Usuarios',
      
      //ruta inicial
      initialRoute: '/home',

      //rutas 
      routes: {
        '/home': (context) => HomePage(),
        '/add': (context) => AddUserPage(),
        '/update': (context) => UpdateUserPage(),
        '/view': (context) => ViewUsersPage(),
      },
    );
  }
}