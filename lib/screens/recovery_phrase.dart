import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;

class RecoveryPhrase extends StatefulWidget {
  const RecoveryPhrase({super.key}); // Use super parameter for key

  @override
  State<RecoveryPhrase> createState() => _RecoveryPhraseState();
}

class _RecoveryPhraseState extends State<RecoveryPhrase> {
  late List<String> _mnemonicWords;

  @override
  void initState() {
    super.initState();
    final mnemonic = bip39.generateMnemonic();
    _mnemonicWords = mnemonic.split(' ');
  }

  @override
  Widget build(final BuildContext context) {
    // Make context final
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 45),
              const Text(
                'This is your recovery phrase',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Make sure to write it down as shown here. \n You have to verify this later.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),

              // Mnemonic grid
              Expanded(
                child: GridView.builder(
                  itemCount: _mnemonicWords.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 4,
                  ),
                  itemBuilder: (final BuildContext context, final int index) {
                    // Make parameters final
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Text(_mnemonicWords[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),
              // iCloud and Template buttons
              OutlinedButton(
                onPressed: () {
                  // TODO: Implement iCloud backup
                },
                style: OutlinedButton.styleFrom(
                  // Use OutlinedButton.styleFrom
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Backup to iCloud',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  // TODO: Implement template printing
                },
                style: OutlinedButton.styleFrom(
                  // Use OutlinedButton.styleFrom
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Print template',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 14),

              // Verify button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to verification screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
