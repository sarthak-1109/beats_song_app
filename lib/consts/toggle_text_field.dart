import 'package:flutter/material.dart';

class ToggleTextField extends StatefulWidget {
  const ToggleTextField({super.key});

  @override
  State<ToggleTextField> createState() => _ToggleTextFieldState();
}

class _ToggleTextFieldState extends State<ToggleTextField> {
  bool _showSearchTextField = false;
  @override
  Widget build(BuildContext context) {
    return _showSearchTextField ? _buildSearchField() : _buildSearchButton();
  }

  Widget _buildSearchButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        // Toggle visibility to true, showing the TextField
        setState(() {
          _showSearchTextField = true;
        });
      },
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
        onSubmitted: (value) {
          // Optionally handle submission, e.g., by running a search query
        },
        onChanged: (value) {
          // Optionally handle change, e.g., displaying search suggestions
        },
      ),
    );
  }
}
