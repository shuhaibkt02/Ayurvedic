import 'package:ayurvedic/presentation/widget/home/search_bar.dart';
import 'package:ayurvedic/presentation/widget/home/sort_by_widget.dart';
import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {},
              icon: const Badge(
                isLabelVisible: true,
                child: Icon(Icons.notifications_none),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          CustomSearchBar(onTap: () {}),
          const SortBy(),
          const Divider(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        onPress: () {},
        buttonLabel: 'Register Now',
      ),
    );
  }
}
