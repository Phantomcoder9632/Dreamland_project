import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DreamHome Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to DreamHome System!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Property Listings
                Navigator.pushNamed(context, '/property_listings');
              },
              child: Text('Property Listings'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to Lease Management
                Navigator.pushNamed(context, '/lease_management');
              },
              child: Text('Lease Management'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to Payment Processing
                Navigator.pushNamed(context, '/payment_processing');
              },
              child: Text('Payment Processing'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Login
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
