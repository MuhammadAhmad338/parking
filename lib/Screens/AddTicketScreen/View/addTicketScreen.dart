import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:parking/Helper/colors.dart';

class Addticketscreen extends StatelessWidget {
  const Addticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: CColors.greyColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 40),
                      Gap(8),
                      Text(
                        'Rs: 20',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number Plate',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Gap(8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: CColors.blackColor), // Default border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: CColors.blackColor), // Enabled border
                    ),
                    hintText: 'Enter number plate',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
