import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking/Screens/AddTicketScreen/View/addTicketScreen.dart';
import 'package:parking/Screens/MainScreen/Controller/mainController.dart';
import 'package:parking/Screens/SearchTicketScreen/View/searchTicketScreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final _screens = [const Addticketscreen(), const Searchticketscreen()];

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
        Get.find<MainScreenController>();
    return Scaffold(
      body: Obx(() => _screens[mainScreenController.pageIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: mainScreenController.changePage,
            currentIndex: mainScreenController.pageIndex.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "ADD"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "List")
            ],
          )),
    );
  }
}
