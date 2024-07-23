import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(maxWidth: 17, maxHeight: 17),
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppStyles.brandColor))));
  }
}
