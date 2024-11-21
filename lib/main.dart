import 'package:flutter/material.dart';
import 'storepage.dart'; // Import StorePage

import 'package:provider/provider.dart';
import 'checkoutpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Cart(), // Replace with your Cart class
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Shopping bag icon
              Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(height: 20), // Space between the icon and text
              // Welcome text
              Text(
                'Welcome to the Item Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // White text for contrast
                ),
              ),
              SizedBox(height: 20),
              // Start shopping button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the StorePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StorePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange, // Change the button's background color
                  foregroundColor: Colors.white, // Change the text color
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12), // Optional: Adjust padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Optional: Add rounded corners
                  ),
                ),
                child: Text(
                  'Start Shopping',
                  style: TextStyle(
                    fontSize: 16, // Optional: Adjust font size
                    fontWeight: FontWeight.bold, // Optional: Adjust font weight
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
