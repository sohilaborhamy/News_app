import 'package:flutter/material.dart';
import 'package:new_app/core/extensions/extensions.dart';
import 'package:provider/provider.dart';


import '../view_model/home_view_model.dart';
import 'widgets/category_home_view.dart';
import 'widgets/custom_drawer_widget.dart';
import 'widgets/selected_category_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.selectedCategory == null
              ? "Home"
              : provider.selectedCategory!.categoryID,
        ),
        actions: [
          const Icon(
            Icons.search,
            size: 30,
          ).setHorizontalPadding(context, 0.04),
        ],
      ),
      drawer: CustomDrawerWidget(),
      body: provider.selectedCategory == null
          ? CategoryHomeView(
              categoriesList: provider.categoriesList,
              onCategoryClicked: provider.onCategoryClicked,
            )
          : SelectedCategoryView(
              selectedCategoryModel: provider.selectedCategory!,
            ),
    );
  }
}
