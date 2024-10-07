import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parking/Helper/colors.dart';

class Searchticketscreen extends StatelessWidget {
  const Searchticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(8),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: CColors.blackColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CColors.blackColor),
                ),
                hintText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4, // Adds shadow around the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    side: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1), // Border around the card
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                    Icons.shopping_cart), // Shopping cart icon
                                const Gap(8),
                                Text(
                                  'Abc-${index + 1}-${1000 + index}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Gap(12),
                        const Text(
                          'Employee Name',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const Gap(8),
                        const Divider(
                          color: Colors.grey, // Horizontal line (hr-like)
                          thickness: 1,
                        ),
                        const Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                            Text(
                              '19 Sep, 2023 04:14 PM',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
