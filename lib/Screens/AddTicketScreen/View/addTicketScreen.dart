import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:gap/gap.dart';
import 'package:parking/Helper/colors.dart';

// Define VehicleType model class
class VehicleType {
  final int id;
  final String name;
  final String image;
  final String urduName;

  VehicleType(
      {required this.id,
      required this.name,
      required this.image,
      required this.urduName});
}

class Addticketscreen extends StatelessWidget {
  const Addticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of VehicleTypes
    List<VehicleType> vehicleTypes = [
      VehicleType(
          id: 1,
          name: 'Cycle',
          urduName: 'سائیکل',
          image: 'assets/images/cycle.svg'),
      VehicleType(
          id: 2,
          name: 'Bike',
          urduName: 'موٹر سائیکل',
          image: 'assets/images/bike.svg'),
      VehicleType(
          id: 3, name: 'Car', urduName: 'گاڑی', image: 'assets/images/car.svg'),
      VehicleType(
          id: 4,
          name: 'Rikshaw',
          urduName: 'رکشہ',
          image: 'assets/images/rickshaw.svg'),
      VehicleType(
          id: 5, name: 'Van', urduName: 'ون', image: 'assets/images/van.svg'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select Vehicle Type', // Title before the list
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vehicleTypes.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicleTypes[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: CColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            CColors.greyColor, // Set the border color to gray
                        width: 1, // Border width
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          vehicle.image, // Use SvgPicture to load SVG assets
                          width: 40,
                          height: 40,
                          color: Colors.grey,
                        ),
                        Gap(8),
                        Text(
                          'Rs: 20', // Assuming a price for illustration
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          vehicle.name, // Display the vehicle name
                          style: const TextStyle(
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
                    cursorColor: Colors.black, // Set cursor color to black
                    decoration: InputDecoration(
                      hintText: 'Enter number plate',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Placeholder in gray
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Default border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Border when not focused
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Border when focused (active)
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black, // Text color when typing
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
