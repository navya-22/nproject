
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

 void savename({ required String name})async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> items = prefs.getStringList('items') ??[];
  items.add(name);
  await prefs.setStringList('items', items );

}


Future<List<String>> getName()async{
   print('test');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('items');
  print(items);
   return items ??[];

}