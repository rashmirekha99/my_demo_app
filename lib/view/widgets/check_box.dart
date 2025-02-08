import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:provider/provider.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<FormProvider, bool>(
      selector: (context, provider) => provider.checBoxValue,
      builder: (context, checkValue, child) {
        return CheckboxListTile(
          value: checkValue,
          onChanged: (value) {
            if (value != null) {
              context.read<FormProvider>().setCheckBoxValue(value);
            }
          },
          title: Text(AppTexts.termsConditions),
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
