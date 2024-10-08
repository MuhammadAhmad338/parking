import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parking/Helper/colors.dart';
import 'package:parking/firebase_options.dart';
import 'Screens/MainScreen/View/mainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parking/InitialBinding/initialBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'PARKING',
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindingImplementation(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: CColors.blueColor, // Change to your desired color
          ),
          // You can also set other properties here, like textTheme, buttonTheme, etc.
        ),
        home: const Mainscreen());
  }
}
