import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PropertyListings extends StatefulWidget {
  @override
  _PropertyListingsState createState() => _PropertyListingsState();
}

class _PropertyListingsState extends State<PropertyListings> {
  List properties = [];

  @override
  void initState() {
    super.initState();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    final response = await http.get(Uri.parse('https://yourdomain.com/api/properties.php'));

    if (response.statusCode == 200) {
      setState(() {
        properties = json.decode(response.body);
      });
    } else {
      print('Error fetching properties');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Property Listings')),
      body: properties.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(properties[index]['propertyName']),
              subtitle: Text(properties[index]['address'] + ", " + properties[index]['city']),
            ),
          );
        },
      ),
    );
  }
}
