import 'package:flutter/material.dart';
import 'package:mind/largeapp.dart';
import 'package:mind/pages/home.dart';

class Intropage extends StatelessWidget {
  final String id; // ✅ make final for immutability
  Intropage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/hunger.png'),
              height: 300,
              width: 300,
            ),
            Text(
              'The Fastest\nFood Delivery',
              style: AppTextStyles.largeFont,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Craving something delicious?\nOrder now and get your favorites\ndelivered fast!',
              style: AppTextStyles.normalFont,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ✅ Pass id properly
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePag(id: id),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(280, 50),
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
