import 'package:flutter/material.dart';
import 'screens/cover.dart';

void main() {
  runApp(BitcoinWalletApp());
}

class BitcoinWalletApp extends StatelessWidget {
  const BitcoinWalletApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CoverScreen(),
    );
  }
}
