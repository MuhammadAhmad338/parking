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
                hintText: 'Enter number plate',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: CColors.blueColor,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Ticket #${index + 1}'),
                    subtitle: Text('Number Plate: ABC-${1000 + index}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle card tap
                      print('Tapped on ticket #${index + 1}');
                    },
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
