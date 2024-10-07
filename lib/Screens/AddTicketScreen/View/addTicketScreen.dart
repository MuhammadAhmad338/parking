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
                    border: Border.all(
                      color: CColors.greyColor, // Set the border color to gray
                      width: 1, // Border width
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 40,
                        color: Colors.grey,
                      ),
                      Gap(8),
                      Text(
                        'Rs: 20',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
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
                  cursorColor:
                      CColors.blackColor, // Set the cursor color to black
                  decoration: InputDecoration(
                    hintText: 'Enter number plate',
                    hintStyle: TextStyle(
                        color: CColors.greyColor), // Placeholder in gray
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.greyColor, // Default border color
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.greyColor, // Border when not focused
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            CColors.blackColor, // Border when focused (active)
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: CColors.blackColor, // Text color when typing
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
