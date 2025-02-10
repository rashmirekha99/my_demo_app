import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_demo_app/theme/color_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPalette.backgroundColor,
      title: title != null ? Text(title!) : null,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          final bool res = Navigator.canPop(context);
          if (res) {
            Navigator.of(context).pop();
          } else {
            SystemNavigator.pop();
          }
        },
        icon: Icon(Icons.adaptive.arrow_back),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
