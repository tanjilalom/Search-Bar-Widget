import 'package:flutter/material.dart';

class filterlist extends StatefulWidget {
  filterlist({
    super.key,
  });

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
                child: TextField(
                  controller: _searchController,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      search = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 4.5),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.yellow)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.red)),
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
                    title: Text(items[index]),
                    subtitle: Text('This is a country name'),
                    textColor: Colors.black,
                    focusColor: Colors.red,
                    tileColor: Colors.green,
                  ),
                  Divider(
                    height: 10,
                  )
                ],
              );
            } else if (items[index]
                .toLowerCase()
                .contains(search.toLowerCase())) {
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
                    title: Text(items[index]),
                    subtitle: Text('This is a country name'),
                    textColor: Colors.black,
                    focusColor: Colors.red,
                    tileColor: Colors.green,
                  ),
                  Divider(
                    height: 10,
                  )
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
