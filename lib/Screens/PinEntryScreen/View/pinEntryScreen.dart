import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking/Helper/const.dart';
import 'package:parking/Screens/MainScreen/View/mainScreen.dart';

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
    return Container(
      width: 20, // Adjust this value as needed
      height: 20, // Adjust this value as needed
      margin: const EdgeInsets.all(4), // Add some spacing between buttons
      child: Material(
        color: Colors.grey[200],
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(fontSize: 24, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(55),
            Image.asset(
              Const.parking,
              scale: 4,
            ),
            const Gap(10),
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
            const Gap(15),
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
                    color: index < _pin.length ? Colors.blue : Colors.grey[300],
                  ),
                ),
              ),
            ),
            const Gap(20),
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
                  _buildKeypadButton('=>', () {
                    Get.to(() => const Mainscreen());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
