import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ["1", "2", "3"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear_rounded,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.deepPurple,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> resultsList = [];
    for (var searchedQuery in searchTerms) {
      if (searchedQuery.toLowerCase().contains(query.toLowerCase())) {
        resultsList.add(searchedQuery);
      }
    }
    // Build result widget as you like...
    return ListView.builder(
      itemCount: resultsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(resultsList[index]),
          onTap: () {
            // Navigate to the result page as you like...
            close(context, resultsList[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    for (var searchedQuery in searchTerms) {
      if (searchedQuery.toLowerCase().contains(query.toLowerCase())) {
        suggestionList.add(searchedQuery);
      }
    }
    // Build suggestion widget as you like...
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
