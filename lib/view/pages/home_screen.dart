import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_images.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/view/dialogs/exit_app_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(style: TextStyle(fontWeight: FontWeight.bold), 'Home'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            final bool res = Navigator.canPop(context);
            if (res) {
              Navigator.of(context).pop();
            }
            dialogBox(context);
          },
          icon: Icon(Icons.adaptive.arrow_back),
        ),
      ),
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
