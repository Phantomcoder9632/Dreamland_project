import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaseManagement extends StatefulWidget {
  @override
  _LeaseManagementState createState() => _LeaseManagementState();
}

class _LeaseManagementState extends State<LeaseManagement> {
  List<dynamic> leases = [];

  @override
  void initState() {
    super.initState();
    fetchLeases();
  }

  Future<void> fetchLeases() async {
    final response = await http.get(Uri.parse('https://yourdomain.com/api/get_leases.php'));

    if (response.statusCode == 200) {
      setState(() {
        leases = json.decode(response.body);
      });
    } else {
      print('Error fetching leases');
    }
  }

  Future<void> addLease(Map<String, String> leaseData) async {
    final response = await http.post(
      Uri.parse('https://yourdomain.com/api/add_lease.php'),
      body: leaseData,
    );
    if (response.statusCode == 200) {
      fetchLeases();
    } else {
      print('Error adding lease');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lease Management')),
      body: ListView.builder(
        itemCount: leases.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Property ID: ${leases[index]['propertyID']}'),
            subtitle: Text('Client: ${leases[index]['clientID']}\nRent: ${leases[index]['monthlyRent']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to lease creation form
        },
        child: Icon(Icons.add),
      ),
    );
  }
}