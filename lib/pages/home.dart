import 'package:flutter/material.dart';
import 'package:mind/pages/cardscreen.dart';
import 'package:mind/pages/homescreen.dart';
import 'package:mind/pages/profile.dart';
import 'package:mind/pages/shopingscreen.dart';

class HomePag extends StatefulWidget {
  final String id;
  HomePag({super.key, required this.id});

  @override
  State<HomePag> createState() => _HomePagState();
}

class _HomePagState extends State<HomePag> {
  int _currentIndex = 0;

  late List<Widget> _pages; 

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      CardScreen(id: widget.id), 
      ProfileScreen(),
      ShppingScreen(id: widget.id)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
