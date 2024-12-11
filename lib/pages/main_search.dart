import 'package:flutter/material.dart';

class SearchBoxPrime extends StatefulWidget {
  const SearchBoxPrime({super.key});

  @override
  State<SearchBoxPrime> createState() => _SearchBoxPrimeState();
}

class _SearchBoxPrimeState extends State<SearchBoxPrime> {
  List<String> allData = [
    'America',
    'Russia',
    'China',
    'Bangladesh',
    'Japan',
    'Korea',
    'Italy',
    'France',
    'England'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Flutter Search Bar'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: CustomSearch(allData: allData));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              var item = allData[index];
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/1.jpg'),
                        radius: 20,
                        //backgroundColor: Colors.red,
                      ),
                    ),
                    //leading: Icon(Icons.person),
                    trailing: const Icon(Icons.menu),
                    iconColor: Colors.black,
                    title: Text(
                      item.toString(),
                    ),
                    subtitle: const Text('This is a country name'),
                    textColor: Colors.black,
                    focusColor: Colors.red,
                    tileColor: Colors.green,
                  ),
                  const Divider(
                    height: 10,
                  )
                ],
              );
            }),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final List<String> allData;

  CustomSearch({required this.allData});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const SizedBox();
    }
    final List<String> suggestion = allData
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return suggestion.isEmpty
        ? const Center(
            child: Text('Nothing found here'),
          )
        : ListView.builder(
            itemCount: suggestion.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DemoScreen(title: suggestion[index])));
                },
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(suggestion[index].toString()),
                ),
              );
            });
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }
}

class DemoScreen extends StatelessWidget {
  DemoScreen({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}
