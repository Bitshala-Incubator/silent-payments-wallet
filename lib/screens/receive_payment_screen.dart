import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePaymentScreen extends StatefulWidget {
  const ReceivePaymentScreen({super.key});

  @override
  State<ReceivePaymentScreen> createState() => _ReceivePaymentScreenState();
}

class _ReceivePaymentScreenState extends State<ReceivePaymentScreen> {
  int _currentPage = 0;
  bool _copied = false;

  final PageController _pageController = PageController();

  final List<String> qrData = [
    'onchain-address-placeholder', // Page 0
    'lightning-invoice-placeholder', // Page 1
  ];

  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: qrData[_currentPage]));
    setState(() => _copied = true);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Done', style: TextStyle(fontSize: 16)),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Details screen
                    },
                    child: const Row(
                      children: [
                        Text('Details', style: TextStyle(fontSize: 16)),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Title
            const Text(
              'Share payment request',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // QR + Feedback
            if (_copied)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Payment request copied ✅', style: TextStyle(color: Colors.green[900])),
              ),

            // Swipeable QR
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: qrData.length,
                onPageChanged: (final index) => setState(() => _currentPage = index),
                itemBuilder: (final context, final index) {
                  return Column(
                    children: [
                      QrImageView(
                        data: qrData[index],
                        version: QrVersions.auto,
                        size: 220.0,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add payment details',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Page indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(qrData.length, (final index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.black : Colors.grey[300],
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Share intent
                      },
                      icon: const Icon(Icons.send),
                      label: const Text('Share'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _copyToClipboard,
                      icon: const Icon(Icons.copy),
                      label: const Text('Copy'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Extra action (e.g., sound)
                      },
                      child: const Icon(Icons.campaign_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
