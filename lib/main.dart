//Imports
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:music_app/utils/databasemanager.dart';
import 'package:music_app/utils/classes.dart';

//Pages
import 'package:music_app/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(!(Platform.isAndroid || Platform.isIOS)){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
    await DbManager.init();

    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      theme: ThemeData.dark(),
    );
  }
}
