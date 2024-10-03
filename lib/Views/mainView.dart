import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PinEntryScreen extends StatefulWidget {
  const PinEntryScreen({super.key});

  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  String _pin = '';

  void _addDigit(String digit) {
    if (_pin.length < 6) {
      setState(() {
        _pin += digit;
      });
    }
  }

  void _removeDigit() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  Widget _buildKeypadButton(String label, VoidCallback onPressed) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.grey[200],
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_outline,
                size: 80,
                color: Colors.blue,
              ),
              const Gap(20),
              const Text(
                'Enter Pin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Gap(5),
              Text(
                'Your Pin is required to enable Touch ID',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index < _pin.length ? Colors.blue : Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const Gap(30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  padding: const EdgeInsets.all(8),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    for (var i = 1; i <= 9; i++)
                      _buildKeypadButton('$i', () => _addDigit('$i')),
                    _buildKeypadButton('⌫', _removeDigit),
                    _buildKeypadButton('0', () => _addDigit('0')),
                    _buildKeypadButton('⟳', () {}),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    // Implement sign in logic here
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
