import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/gender_enum.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:provider/provider.dart';

class RadioButtonSection extends StatelessWidget {
  const RadioButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<FormProvider, Gender>(
      selector: (context, provider) => provider.gender,
      builder: (context, genderProviderValue, child) {
        return Row(
          children:
              Gender.values
                  .map(
                    (gender) => Flexible(
                      flex: 1,
                      child: RadioListTile(
                        title: Text(gender.name.toString().toUpperCase()),
                        value: gender,
                        groupValue: genderProviderValue,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<FormProvider>().setGender(value);
                          }
                        },
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
