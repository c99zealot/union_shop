import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.7)),
          ),
          const Positioned(
            top: 80,
            left: 24,
            right: 24,
            child: Column(
              children: const [
                Text(
                  'Placeholder Hero Title',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'This is placeholder text for the hero section.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
