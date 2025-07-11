import 'package:flutter/material.dart';
import 'send_confirm_screen.dart';

class SendAmountScreen extends StatefulWidget {
  final String recipientAddress;

  const SendAmountScreen({super.key, required this.recipientAddress});

  @override
  State<SendAmountScreen> createState() => _SendAmountScreenState();
}

class _SendAmountScreenState extends State<SendAmountScreen> {
  String _amount = '';

  void _appendDigit(final String digit) {
    setState(() {
      if (digit == '←') {
        if (_amount.isNotEmpty) {
          _amount = _amount.substring(0, _amount.length - 1);
        }
      } else if (digit == '.' && _amount.contains('.')) {
        return; // prevent multiple decimals
      } else {
        _amount += digit;
      }
    });
  }

  void _onContinue() {
    if (_amount.isEmpty || double.tryParse(_amount) == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (final context) => SendConfirmScreen(
          recipientAddress: widget.recipientAddress,
          amount: _amount,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final availableBalance = '00sats'; // placeholder

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),

              // BTC input display
              Text(
                _amount.isEmpty ? '0' : _amount,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),

              // Balance display
              Text(
                'Balance: $availableBalance',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),

              const SizedBox(height: 32),

              // Custom keypad
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeypadRow(['1', '2', '3']),
                    _buildKeypadRow(['4', '5', '6']),
                    _buildKeypadRow(['7', '8', '9']),
                    _buildKeypadRow(['.', '0', '←']),
                  ],
                ),
              ),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadRow(final List<String> digits) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: digits.map((final d) {
          return GestureDetector(
            onTap: () => _appendDigit(d),
            child: Container(
              width: 80,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Text(d, style: const TextStyle(fontSize: 24)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
