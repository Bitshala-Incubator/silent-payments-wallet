import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(final BuildContext context) {
    final List<Map<String, String>> transactions = [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              // Top Row
              const Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.currency_bitcoin,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Bitcoin Wallet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Balance Section
              Text(
                'Your Balance',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              const Row(
                children: [
                  Text(
                    '00 sats', // Placeholder
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 50),

              // Activity + History
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {}, // TODO: Hook up to history screen
                    child: const Row(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.double_arrow, size: 20, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),

              // Activity Section
              Expanded(
                child: transactions.isEmpty
                    ? Center(
                        child: Text(
                          'No transactions made yet!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (final context, final index) {
                          final tx = transactions[index];
                          final isSent = tx['amount']!.startsWith('-');
                          final icon = isSent
                              ? Icons.arrow_upward
                              : Icons.arrow_downward;
                          final color = isSent ? Colors.black : Colors.green;

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(icon, color: color),
                            title: Text(tx['address']!),
                            subtitle: Text(tx['time']!),
                            trailing: Text(
                              tx['amount']!,
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 16),

              // Receive + Send Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to Receive screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Text(
                        'Receive',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to Send screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
