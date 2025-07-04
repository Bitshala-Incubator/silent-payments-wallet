import 'package:flutter/material.dart';

class RecoverySuccessScreen extends StatelessWidget {
  const RecoverySuccessScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Green check icon
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.check, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 32),

              // Success title
              const Text(
                'Perfect.\nMake sure to securely store your recovery phrase.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                'You should now have your recovery phrase written down for future reference.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 48),

              // Done button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Proceed to wallet home or dashboard
                    Navigator.popUntil(context, (final route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Done!', style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
