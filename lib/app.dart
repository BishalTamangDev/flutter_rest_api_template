import 'package:flutter/material.dart';
import 'package:rest_api_template/presentation/pages/home_page.dart';

class RestApiApp extends StatelessWidget {
  const RestApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "REST API TEMPLATE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: false,
      ),
      home: HomePage(),
    );
  }
}
