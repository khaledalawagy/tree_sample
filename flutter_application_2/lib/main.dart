import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_item/item_model.dart';
import 'package:flutter_application_2/dashboard/dashboard_screen.dart';
import 'package:flutter_application_2/profile/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: DashboardScreen(),
    );
  }
}
