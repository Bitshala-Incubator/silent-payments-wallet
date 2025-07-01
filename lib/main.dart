import 'package:flutter/material.dart';

void main() {
  runApp(BitcoinWalletApp());
}

class BitcoinWalletApp extends StatelessWidget {
  const BitcoinWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Wallet',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Arial'),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Logo
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.currency_bitcoin,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),

              // Title
              Text(
                'Bitcoin Wallet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Subtitle
              Text(
                'A bitcoin wallet for all your payments.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              Spacer(),

              // Create Wallet Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to create wallet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Create a new wallet',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Restore Wallet Button
              TextButton(
                onPressed: () {
                  // TODO: Navigate to restore wallet
                },
                child: Text(
                  'Restore existing wallet',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              SizedBox(height: 16),

              // Footer text
              Text(
                'Your wallet, your coins\n100% open-source & open-design',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
