import 'package:flutter/material.dart';
import 'package:mind/detailpage/crudtutorial.dart.dart';
import 'package:mind/largeapp.dart';

class Update extends StatefulWidget {
  

   Update({
    super.key,
    
    required this.namecontroller,
    required this.productcontroller,
    required this.productnamecontroller,
    required this.citycontroller,
    required this.villagecontroller,
    required this.numbercontroller,
    required this.id,

  });
     TextEditingController namecontroller;
   TextEditingController productcontroller;
   TextEditingController productnamecontroller;
   TextEditingController citycontroller;
   TextEditingController villagecontroller;
   TextEditingController numbercontroller;
   String id;
   
     

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
 

  @override
  
  

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
                      controller: widget.namecontroller,
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
                            controller: widget.productcontroller,
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
                            controller: widget.productnamecontroller,
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
                            controller: widget.citycontroller,
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
                            controller: widget.villagecontroller,
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
                      controller: widget.numbercontroller,
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
                            widget.namecontroller.text,
                            widget.productcontroller.text,
                            widget.productnamecontroller.text,
                            widget.citycontroller.text,
                            widget.villagecontroller.text,
                            widget.numbercontroller.text,
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
