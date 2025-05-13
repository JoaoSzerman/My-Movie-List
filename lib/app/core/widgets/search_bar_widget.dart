import 'package:flutter/material.dart';

import '../core.dart';

class SearchBarWidget extends StatelessWidget {
  final dynamic controller;
  final dynamic textController;
  const SearchBarWidget({
    super.key,
    required this.controller,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: TextField(
        onSubmitted: controller.onSearch,
        controller: textController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: AppConstants.SEARCH,
          hintStyle: const TextStyle(color: AppColors.hintText),
          suffixIcon: const Icon(Icons.search, color: AppColors.hintText),
          filled: true,
          fillColor: AppColors.searchBar,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
