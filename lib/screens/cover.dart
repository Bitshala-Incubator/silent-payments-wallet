import 'package:flutter/material.dart';
import 'intro.dart';

void main() {
  runApp(const BitcoinWalletApp());
}

class BitcoinWalletApp extends StatelessWidget {
  const BitcoinWalletApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Wallet',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Arial'),
      home: CoverScreen(),
    );
  }
}

class CoverScreen extends StatelessWidget {
  const CoverScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.currency_bitcoin,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Bitcoin Wallet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                'A bitcoin wallet for all your payments.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const Spacer(),

              // Create Wallet Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (final context) => const Intro(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Create a new wallet',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Restore Wallet Button
              TextButton(
                onPressed: () {
                  // TODO: Navigate to restore wallet
                },
                child: const Text(
                  'Restore existing wallet',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 16),

              // Footer text
              const Text(
                'Your wallet, your coins\n100% open-source & open-design',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
