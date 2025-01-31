import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(() => MaterialApp(
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.teal,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
          ),
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
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Dark and Light Mode"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      themeController.isDarkMode.value
                          ? Icons.nights_stay
                          : Icons.wb_sunny,
                      size: 30,
                      color: themeController.isDarkMode.value
                          ? Colors.tealAccent
                          : Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Text(
                      themeController.isDarkMode.value
                          ? 'وضع الظلام'
                          : 'وضع الإضاءة',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                )),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: themeController.toggleTheme,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: themeController.isDarkMode.value
                    ? Colors.tealAccent
                    : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    themeController.isDarkMode.value
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "تبديل الوضع",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? Colors.grey[800]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: themeController.isDarkMode.value
                        ? Colors.black45
                        : Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Text(
                'ابراهيم المعقلي',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
