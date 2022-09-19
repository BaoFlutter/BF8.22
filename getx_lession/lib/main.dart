import 'package:api_lession/providers/user_provider.dart';
import 'package:api_lession/views/user_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> UserProvider()),
        ],
      child:  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),

    );
  }
}

