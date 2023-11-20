import 'package:flutter/material.dart';
import 'package:search_bar/custom_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchBar'),
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
    );
  }
}
