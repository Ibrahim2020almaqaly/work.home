import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class ThemeController extends GetxController {
  // Observable for theme mode
  var isDarkMode = false.obs;

  // Method to toggle theme mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController()); // Initialize controller

    return Obx(() => MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.isDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      home: HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>(); // Retrieve controller

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              themeController.isDarkMode.value ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: themeController.toggleTheme,
              child: Text('Toggle Theme'),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? Colors.grey[800]
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'ابراهيم المعقلي',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : const Color.fromARGB(230, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
