import 'package:flutter/material.dart';

class filterlist extends StatefulWidget {
  @override
  State<filterlist> createState() => _filterlistState();
}

class _filterlistState extends State<filterlist> {
  bool isSearchClick = false;
  String search = '';
  final TextEditingController _searchController = TextEditingController();
  List<String> items = [
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: isSearchClick
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      search = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            : Text('Search Bar'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClick = !isSearchClick;
                if (!isSearchClick) {
                  _searchController.clear();
                }
              });
            },
            icon: Icon(isSearchClick ? Icons.close : Icons.search),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (_searchController.text.isEmpty) {
              return ListTile(
                title: Text(items[index]),
              );
            } else if (items[index]
                .toLowerCase()
                .contains(search.toLowerCase())) {
              return ListTile(
                title: Text(items[index]),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
