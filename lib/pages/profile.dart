import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int walletBalance = 0; 
  int selectedAmount = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(

        title: const Text(
          "Wallet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white 
          ),
          
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Wallet Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet,
                      size: 55, color: Colors.orange),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Wallet",
                        style: TextStyle(
                          fontSize: 20, // font bada
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "\$$walletBalance",
                        style: const TextStyle(
                          fontSize: 26, // aur bada font
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Amount Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _amountButton(100),
                _amountButton(50),
                _amountButton(200),
              ],
            ),
            const SizedBox(height: 35),

            // Add Money Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: selectedAmount == 0
                    ? null
                    : () {
                        setState(() {
                          walletBalance += selectedAmount;
                          selectedAmount = 0; // reset after adding
                        });
                      },
                child: const Text(
                  "Add Money",
                  style: TextStyle(
                    fontSize: 20, // font size bada
                    fontWeight: FontWeight.bold, // aur bold
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Custom Button Widget with Logic
  Widget _amountButton(int amount) {
    bool isSelected = selectedAmount == amount;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        side: BorderSide(color: isSelected ? Colors.red : Colors.grey),
        backgroundColor: isSelected ? Colors.red[50] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedAmount = amount;
        });
      },
      child: Text(
        "\$$amount",
        style: TextStyle(
          fontSize: 18, // font thoda bada
          fontWeight: FontWeight.bold, // bold
          color: isSelected ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
