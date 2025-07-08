import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState!.validate()) {
      final address = _addressController.text.trim();
      // TODO: Navigate to next screen and pass this address
      print('Sending to: $address');
    }
  }

  Future<void> _pasteFromClipboard() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        _addressController.text = clipboardData.text!.trim();
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Address pasted from clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                Text(
                  'Choose a recipient',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),

                Text('Address', style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),

                // Address Input
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter address...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.paste, color: Colors.grey),
                          onPressed: _pasteFromClipboard,
                        ),
                        // iconbuttons for QR code and contact picker
                        // Uncomment and implement these if needed
                        // IconButton(
                        //   icon: Icon(Icons.qr_code, color: Colors.grey),
                        //   onPressed: null, // TODO: Add QR scanner
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.person_outline, color: Colors.grey),
                        //   onPressed: null, // TODO: Add contact picker
                        // ),
                      ],
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a valid address';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24),

                // Continue Button
                ElevatedButton(
                  onPressed: _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
