import 'package:flutter/material.dart';
import 'package:mind/detailpage/crudtutorial.dart.dart';
import 'package:mind/largeapp.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderNaw extends StatefulWidget {
  OrderNaw({
    super.key,
    required this.image,
    required this.price,
    required this.name,
  });

  String image;
  String price;
  String name;

  @override
  State<OrderNaw> createState() => _OrderNawState();
}

class _OrderNawState extends State<OrderNaw> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController productcontroller = TextEditingController();
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Order Now")),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04), 
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  Image.asset(
                    widget.image,
                    height: height * 0.25, // responsive height
                    width: width * 0.5,   // responsive width
                  ),

                  SizedBox(height: height * 0.015),

                  // Product Name
                  Text(
                    widget.name,
                    style: AppTextStyles.largeFont,
                  ),

                  Text(
                    widget.price,
                    style: AppTextStyles.normalFont,
                  ),

                  SizedBox(height: height * 0.02),

                  Text(
                    'Fill your details',
                    style: AppTextStyles.largeFont,
                  ),

                  SizedBox(height: height * 0.015),

                  // Full Name
                  TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                  ),

                  SizedBox(height: height * 0.015),

                  
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: productcontroller,
                          decoration: InputDecoration(
                            hintText: 'Total Product',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: TextFormField(
                          controller: productnamecontroller,
                          decoration: InputDecoration(
                            hintText: 'Product Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  // City + Village
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: citycontroller,
                          decoration: InputDecoration(
                            hintText: 'City Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: TextFormField(
                          controller: villagecontroller,
                          decoration: InputDecoration(
                            hintText: 'Village/Town Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  // Mobile Number
                  TextFormField(
                    controller: numbercontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile no:',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your number' : null,
                  ),

                  SizedBox(height: height * 0.02),

                  // Payment Button
                  SizedBox(
                    width: width * 0.9, // responsive width
                    child: ElevatedButton(
                      onPressed: () {
                        String qrData =
                            "Name: ${namecontroller.text}, Product: ${productnamecontroller.text}, Price: ${widget.price}";

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Payment QR Code"),
                              content: SizedBox(
                                width: width * 0.6,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    QrImageView(
                                      data: qrData,
                                      size: width * 0.5,
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Text("Scan this QR to pay"),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Close"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.8, height * 0.07),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Payment Now",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Submit Button
                  SizedBox(
                    width: width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Crudtutorial().OrderNaw(
                            namecontroller.text,
                            productcontroller.text,
                            productnamecontroller.text,
                            citycontroller.text,
                            villagecontroller.text,
                            numbercontroller.text,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.deepOrangeAccent,
                              content: Text("Order Placed!"),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.8, height * 0.07),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Order Submited",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
