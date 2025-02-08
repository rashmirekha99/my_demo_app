import 'package:flutter/material.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:provider/provider.dart';

class RadioButtonSection extends StatelessWidget {
  RadioButtonSection({super.key});

  final List<String> radioOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          radioOptions
              .map(
                (option) => Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: '',
                    // context.watch<FormProvider>().gender,
                    onChanged: (value) {
                      if (value != null) {
                        //context.read<FormProvider>().setGender(value);
                      }
                    },
                  ),
                ),
              )
              .toList(),
    );
  }
}
