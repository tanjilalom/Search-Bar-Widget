import 'package:flutter/material.dart';

class searchlistview extends StatefulWidget {
  const searchlistview({super.key,});


  @override
  State<searchlistview> createState() => _searchlistviewState();
}

class _searchlistviewState extends State<searchlistview> {

  String search = '';
  TextEditingController searchController = TextEditingController();

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

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: searchController,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search),
                  //border: OutlineInputBorder(),
                  hintText: 'Select Country',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.yellow)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    search = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if (searchController.text.isEmpty) {
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
                              iconColor: Colors.black,
                              title: Text(items[index]),
                              subtitle: const Text('This is a country name'),
                              textColor: Colors.black,
                              focusColor: Colors.red,
                              tileColor: Colors.green,
                            ),
                            const Divider(height: 10,)
                          ],
                        );
                      } else if (items[index].toLowerCase().contains(search.toLowerCase())) {
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
                              iconColor: Colors.black,
                              title: Text(items[index]),
                              subtitle: const Text('This is a country name'),
                              textColor: Colors.black,
                              focusColor: Colors.red,
                              tileColor: Colors.green,
                            ),
                            const Divider(height: 10,)
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}