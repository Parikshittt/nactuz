import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async library for Timer
import '../styles/app_styles.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged() {
    if (_controller.text.length < 3) {
      // If the input text is less than 3 characters, do nothing
      return;
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.onChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        suffixIconConstraints:
            const BoxConstraints(maxWidth: 17, maxHeight: 17),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppStyles.brandColor),
        ),
      ),
      onChanged: (text) {
        _onSearchChanged();
      },
    );
  }
}
