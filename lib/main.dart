import 'package:flutter/material.dart';
import 'storepage.dart'; 

import 'package:provider/provider.dart';
import 'checkoutpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Cart(), 
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
        
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(height: 20), 
              
              Text(
                'Welcome to the Item Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                ),
              ),
              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StorePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange, 
                  foregroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Optional: Add rounded corners
                  ),
                ),
                child: Text(
                  'Start Shopping',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
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
