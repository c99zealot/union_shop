import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header_section.dart';
import 'package:union_shop/widgets/hero_section.dart';
import 'package:union_shop/widgets/featured_products_section.dart';
import 'package:union_shop/widgets/footer_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            HeroSection(),
            FeaturedProductsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}