import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentProcessing extends StatefulWidget {
  @override
  _PaymentProcessingState createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessing> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController propertyIdController = TextEditingController();
  bool isProcessing = false;

  Future<void> processPayment() async {
    setState(() {
      isProcessing = true;
    });

    final response = await http.post(
      Uri.parse('https://yourdomain.com/api/process_payment.php'),
      body: {
        'property_id': propertyIdController.text,
        'amount': amountController.text,
      },
    );

    setState(() {
      isProcessing = false;
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Processed Successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Failed! Please try again.')),
        );
      }
    } else {
      print('Error processing payment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Processing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: propertyIdController,
              decoration: InputDecoration(labelText: 'Property ID'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isProcessing ? null : processPayment,
              child: isProcessing
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Process Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
