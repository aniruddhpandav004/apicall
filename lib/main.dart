import 'package:apicall/screen/provider/homeProvider.dart';
import 'package:apicall/screen/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create : (context)=> HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => HomeScreen(),
        },
      ),
    ),
  );
}
