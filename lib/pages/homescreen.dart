import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:mind/largeapp.dart';
import 'package:mind/new%20page/burger.dart';
import 'package:mind/new%20page/chanies.dart';
import 'package:mind/new%20page/maxicon.dart';
import 'package:mind/new%20page/pizza.dart';

// Alag-alag pages import karo

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: ButtonsTabBar(
            backgroundColor: Colors.red,
            
          unselectedBorderColor: Colors.black,
            
            
            unselectedBackgroundColor: Colors.grey,
            borderWidth: 1,
            height: 50,
            width: 170,
            radius: 30,
            buttonMargin: const EdgeInsets.only(left: 20, right: 20),
            tabs: const [
              Tab(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/pizza1.png'),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 30),
                    Text("Pizza", style: AppTextStyles.normalFont),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/burger1.png'),
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 20),
                    Text("Burger", style: AppTextStyles.normalFont),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/chanies1.png'),
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 15),
                    Text("Chanies", style: AppTextStyles.normalFont),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/maxican1.png'),
                      height: 60,
                      width: 50,
                    ),
                    SizedBox(width: 10),
                    Text("Maxicon", style: AppTextStyles.normalFont),
                  ],
                ),
              ),
            ],
          ),
          toolbarHeight: 200,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/logo.png'),
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          'Order your favourite food',
                          style: AppTextStyles.normalFont,
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/boy.png'),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 1, right: 1, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search anythink',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        /// Yaha har Tab ke liye page connect hoga
        body:  TabBarView(
          children: [
            PizzaPage(searchQuery: '',),
            BurgerPage(searchQuery: '',),
            ChaniesPage(searchQuery: '',),
            MaxiconPage(searchQuery: '',),
          ],
        ),
      ),
    );
  }
}
