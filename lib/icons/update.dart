import 'package:flutter/material.dart';
import 'package:mind/detailpage/crudtutorial.dart.dart';
import 'package:mind/largeapp.dart';

class Update extends StatefulWidget {
  final String id;

  final String name;
  final String product;
  final String productname;
  final String city;
  final String village;
  final String number;

  const Update({
    super.key,
    required this.id,
    required this.name,
    required this.product,
    required this.productname,
    required this.city,
    required this.village,
    required this.number,
  });

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late TextEditingController namecontroller;
  late TextEditingController productcontroller;
  late TextEditingController productnamecontroller;
  late TextEditingController citycontroller;
  late TextEditingController villagecontroller;
  late TextEditingController numbercontroller;

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController(text: widget.name);
    productcontroller = TextEditingController(text: widget.product);
    productnamecontroller = TextEditingController(text: widget.productname);
    citycontroller = TextEditingController(text: widget.city);
    villagecontroller = TextEditingController(text: widget.village);
    numbercontroller = TextEditingController(text: widget.number);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.grey),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    ),

                    SizedBox(height: height * 0.015),

                    // Row for Total Product & Product Name
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
                    ),

                    SizedBox(height: height * 0.02),

                    // Submit Button
                    SizedBox(
                      width: width * 0.9,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Crudtutorial().Update(
                            widget.id,
                            namecontroller.text,
                            productcontroller.text,
                            productnamecontroller.text,
                            citycontroller.text,
                            villagecontroller.text,
                            numbercontroller.text,
                          );

                          Navigator.pop(context); // close dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.lightGreenAccent,
                              content: Text("Order Updated!"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.8, height * 0.07),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Order Updated",
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
            );
          },
        );
      },
    );
  }
}
