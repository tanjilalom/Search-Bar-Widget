import 'package:flutter/material.dart';

class filterlist extends StatefulWidget {
  @override
  State<filterlist> createState() => _filterlistState();
}

class _filterlistState extends State<filterlist> {

  bool isSearchClick = false;
  final TextEditingController _searchController = TextEditingController();
  String searctText = '';
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

  List<String> filtereItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filtereItems = List.from(items);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searctText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searctText.isEmpty) {
      filtereItems = List.from(items);
    } else {
      filtereItems = items
          .where(
              (items) => items.toLowerCase().contains(searctText.toLowerCase()))
          .toList();
    }
  }

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
                  onChanged: _onSearchChanged,
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
                  myFilterItems();
                }
              });
            },
            icon: Icon(isSearchClick ? Icons.close : Icons.search),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: filtereItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filtereItems[index]),
            );
          }),
    );
  }
}
