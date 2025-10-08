import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import 'package:proyecto_4_octubre_2025/src/pages/alert_page.dart';
import 'package:proyecto_4_octubre_2025/src/pages/avatar_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/':(BuildContext context)=> HomePage(),
    'alert': (BuildContext context)=> AlertPage(),
    'avatar': (BuildContext context)=> AvatarPages(),

  };
}