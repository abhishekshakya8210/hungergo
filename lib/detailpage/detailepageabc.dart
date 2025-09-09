import 'package:flutter/material.dart';
import 'package:mind/detailpage/ordernow.dart';

class PizzaDetailPage extends StatefulWidget {
  PizzaDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });
  String name;
  String price;
  String image;

  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
  int quantity = 1;
  double price = 50.0;

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pizza Image
          Center(
            child:Image(image: AssetImage(widget.image),
            height: screenHeight*0.3,
            width: screenWidth*0.8,
            fit: BoxFit.contain,)
          ),
          SizedBox(height: screenHeight * 0.02),

          // Title and Price
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              widget.name,
              style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              widget.price,
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              "We’ve established that most cheeses will melt when baked atop pizza. "
              "But which will not only melt but stretch into those gooey, messy strands "
              "that can make pizza eating such a delightfully challenging endeavor?",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          // Quantity Selector
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              children: [
                Text("Quantity",
                    style: TextStyle(fontSize: screenWidth * 0.045)),
                SizedBox(width: screenWidth * 0.05),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    icon: const Icon(Icons.remove, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Bottom Buttons
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              children: [
                Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "\$${(price * quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:
                 (context)=>OrderNaw(image: widget.image,
                  price: widget.price,
                   name: widget.name
                   )));
                
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.5,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
