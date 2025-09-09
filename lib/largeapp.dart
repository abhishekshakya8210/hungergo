import 'package:flutter/material.dart';

class AppTextStyles {
  // Large Font (Heading ke liye)
  static const TextStyle largeFont = TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  // Normal Font (Subheading ke liye)
  static const TextStyle normalFont = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  // Small Font (Description ke liye)
  static const TextStyle smallFont = TextStyle(
    color: Colors.black54,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4, // line spacing thoda acha lagta hai
  );
}
