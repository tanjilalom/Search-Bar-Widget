import 'package:flutter/material.dart';
import 'package:search_bar/pages/dropdown_search.dart';
import 'package:search_bar/pages/filter_list.dart';
import 'package:search_bar/pages/main_search.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const searchlistview()),
                  );
                },
                child: const Text('Search Listview')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => filterlist()));
                },
                child: const Text('Appbar Search Listview')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchBoxPrime()));
                },
                child: const Text('Main Search Listview')),
          ],
        ),
      ),
    );
  }
}
