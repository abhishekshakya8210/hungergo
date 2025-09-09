import 'package:flutter/material.dart';
import 'package:mind/detailpage/detailepageabc.dart';
import 'package:mind/largeapp.dart';

class MaxiconPage extends StatelessWidget {
   MaxiconPage({super.key, required String searchQuery});

 final List pizza = [
    {
      'image': "assets/maxicon2.png",
      "name": 'maregherita maxicon',
      'price': '\$ 80'
    },
    {
      'image': "assets/maxicon3.png",
      "name": 'Cheese maxicon',
      'price': '\$ 40'
    },
    {
      'image': "assets/maxicon4.png",
      "name": 'maregherita maxicon',
      'price': '\$ 70'
    },
    {
      'image': "assets/maxicon5.png",
      "name": 'cheese maxicon',
      'price': '\$ 90'
    },
  ];

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(width * 0.02), 
              child: GridView.builder(
                itemCount: pizza.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > 600 ? 4 : 2, 
                  crossAxisSpacing: width * 0.04,
                  mainAxisSpacing: width * 0.04,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetailPage(
                            name: pizza[index]['name'],
                            price: pizza[index]['price'],
                            image: pizza[index]['image'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Pizza Image
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                pizza[index]['image'],
                                height: height * 0.12, 
                                width: width * 0.25,  
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Name
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: Text(
                              pizza[index]['name'],
                              style: AppTextStyles.normalFont.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04, 
                              ),
                            ),
                          ),

                          // Price
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.005,
                            ),
                            child: Text(
                              pizza[index]['price'],
                              style: AppTextStyles.normalFont.copyWith(
                                fontSize: width * 0.035,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),

                          // Red button (arrow)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: height * 0.05, 
                              width: width * 0.12,  
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
 
  }
}
