import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mind/detailpage/crudtutorial.dart.dart';
import 'package:mind/icons/delete.dart';
import 'package:mind/icons/update.dart';
import 'package:mind/largeapp.dart';

class CardScreen extends StatefulWidget {
  
 
   CardScreen({super.key, 
  required this.namecontroller,
    required this.productcontroller,
    required this.productnamecontroller,
    required this.citycontroller,
    required this.villagecontroller,
    required this.numbercontroller,
   

  });
  TextEditingController namecontroller;
   TextEditingController productcontroller;
   TextEditingController productnamecontroller;
   TextEditingController citycontroller;
   TextEditingController villagecontroller;
   TextEditingController numbercontroller;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Crudtutorial().CardScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Data Found!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var doc = data[index];
              Map<String, dynamic> map = doc.data() as Map<String, dynamic>;

              // ✅ Safe null handling
              String name = map['NameAttribute'] ?? '';
              String product = map['ProductAttribute'] ?? '';
              String productName = map['ProductnameAttribute'] ?? '';
              String city = map['CityAttribute'] ?? '';
              String village = map['VillageAttribute'] ?? '';
              String number = map['NumberAttribute'] ?? '';
 
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/login1.png',
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),

                      //  Info Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ✅ Product + Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productName,
                                  style: AppTextStyles.normalFont.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.currency_rupee,
                                        size: 18, color: Colors.green),
                                    Text(
                                      '499', //you can make dynamic if Firestore has price
                                      style: AppTextStyles.normalFont.copyWith(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            //  Customer Info
                            Text("Customer: $name",
                                style: AppTextStyles.normalFont
                                    .copyWith(color: Colors.black87)),
                            Text("Type: $product",
                                style: AppTextStyles.normalFont
                                    .copyWith(color: Colors.black54)),
                            Text("City: $city, $village",
                                style: AppTextStyles.smallFont
                                    .copyWith(color: Colors.black54)),
                            Text("Mobile: $number",
                                style: AppTextStyles.smallFont
                                    .copyWith(color: Colors.black54)),

                            const SizedBox(height: 8),

                            //  Status + Buttons
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Colors.red.shade200),
                                  ),
                                  child: const Text(
                                    "Pending",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                //  Update Button
                              Update(
                                namecontroller: widget.namecontroller,
                                 productcontroller: widget.productcontroller, 
                                 productnamecontroller: widget.productnamecontroller,
                                  citycontroller: widget.citycontroller, 
                                  villagecontroller: widget.villagecontroller,
                                   numbercontroller: widget.numbercontroller,
                                    id:doc.id,
                                    ),
                                 SizedBox(width: 10),

                                //
                                   Delete(id: doc.id)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
