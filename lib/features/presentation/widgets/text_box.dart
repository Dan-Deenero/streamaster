import 'package:flutter/material.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  void Function()? onPressed;
  MyTextBox({super.key, required this.text, required this.sectionName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(text: sectionName, fontSize: 14, textColor: Colors.grey.shade500),
             GestureDetector(
              onTap: onPressed,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Icon(Icons.settings, 
                  color: Theme.of(context).colorScheme.surface,),
               ),
             )
          ],
        ),
        Text(text)
      ]),
    );
  }
}
