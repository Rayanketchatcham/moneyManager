import 'package:flutter/material.dart';

class Moneycardwidget extends StatefulWidget {
  const Moneycardwidget({super.key});

  @override
  State<Moneycardwidget> createState() => _MoneycardwidgetState();
}

class _MoneycardwidgetState extends State<Moneycardwidget> {
  String currency = "USD"; // Devise par défaut
  double amount = 17800; // Montant par défaut

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '${amount}',
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              currency,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
