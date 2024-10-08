//Imports
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:music_app/utils/databasemanager.dart';

//Pages
import 'package:music_app/homepage.dart';

void main() async{
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    await DbManager.init();

    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage()
    );
  }
}
