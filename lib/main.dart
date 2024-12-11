import 'package:flutter/material.dart';
import 'package:search_bar/homepage.dart';
import 'package:search_bar/pages/dropdown_search.dart';
import 'package:search_bar/pages/main_search.dart';
import 'package:search_bar/pages/filter_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
