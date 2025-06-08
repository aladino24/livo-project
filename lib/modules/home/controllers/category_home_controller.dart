import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryHomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

 void scrollRight() {
  if (scrollController.hasClients) {
    scrollController.animateTo(
      scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}