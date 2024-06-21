import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  SearchBoxWidget(
      {super.key,
      this.isPrefixIcon,
      this.iconColor,
      this.iconSize,
      this.icon,
      required this.countries});

  final List<String> countries;
  final bool? isPrefixIcon;
  final Color? iconColor;
  final double? iconSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Autocomplete<String>(



          optionsViewBuilder: (context, onAutoCompleteSelect, options) {
            return Align(
              alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width -30,
                  child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.person),
                              trailing: Icon(Icons.menu),
                              subtitle: Text('This is a country name'),
                              textColor: Colors.black,
                              focusColor: Colors.red,
                              tileColor: Colors.green,
                              title: Text(countries[index]),
                              onTap: () {
                                // Handle the selection of an option
                              },
                            ),
                            Divider(
                              height: 10,
                            )
                          ],
                        );
                      }),
                ),
              );
          },



          optionsBuilder: (textEditingValue) {
            return countries
                .where((country) => country
                    .toLowerCase()
                    .startsWith(textEditingValue.text.toLowerCase()))
                .toList();
          },
          displayStringForOption: (country) => country,
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                prefixIcon: isPrefixIcon == true
                    ? Icon(icon, size: iconSize, color: iconColor)
                    : null,
                //border: OutlineInputBorder(),
                hintText: 'Select Country',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.yellow)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              style: TextStyle(fontWeight: FontWeight.bold),
              onChanged: (text) {},
            );
          },
          onSelected: (String selection) {
            print('Selected: $selection');
          },
        ),
      ),
    );
  }
}
