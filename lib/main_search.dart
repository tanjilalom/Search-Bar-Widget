import 'package:flutter/material.dart';

class mainSearch extends StatefulWidget {
  const mainSearch({super.key});

  @override
  State<mainSearch> createState() => _mainSearchState();
}

class _mainSearchState extends State<mainSearch> {
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
          title: Text('Flutter Search Bar'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: CustomSearch(allData: allData));
              },
              icon: Icon(Icons.search),
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
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    //leading: Icon(Icons.person),
                    iconColor: Colors.black,
                    title: Text(
                      item.toString(),
                    ),
                    subtitle: Text('This is a country name'),
                    textColor: Colors.black,
                    focusColor: Colors.red,
                    tileColor: Colors.green,
                  ),
                  Divider(height: 10,)
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
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SizedBox();
    }
    final List<String> suggestion = allData
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return suggestion.isEmpty
        ? Center(
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
                  leading: Icon(Icons.person),
                  title: Text(suggestion[index].toString()),
                ),
              );
            });
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
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
