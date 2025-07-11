import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'send_success_screen.dart';

class SendConfirmScreen extends StatelessWidget {
  final String recipientAddress;
  final String amount;

  const SendConfirmScreen({
    Key? key,
    required this.recipientAddress,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fee = '0.0'; // placeholder
    final String timestamp = DateFormat.yMMMd().add_jm().format(
      DateTime.now(),
    ); // e.g., Aug 12, 2021 at 4:35pm

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),
              Text(
                'Ready to send?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              _buildField('To', recipientAddress),
              _buildField(
                'Amount',
                '$amount'
                    ' sats',
              ),
              _buildField('Fee', fee),
              _buildField('Time', timestamp),

              Spacer(),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SendSuccessScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }
}
