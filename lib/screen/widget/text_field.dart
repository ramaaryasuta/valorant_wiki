import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.blueGrey.shade900,
          filled: true,
          prefixIconColor: Colors.grey,
          hintText: 'Search Agent...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
