import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_images.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/view/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.logoImage, width: AppStyleSizes.appLogoWidth),
          ],
        ),
      ),
    );
  }
}
