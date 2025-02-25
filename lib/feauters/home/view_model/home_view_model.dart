import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../data/models/article_model.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/source_model.dart';
import '../../../data/network/api_network.dart';

class HomeViewModel extends ChangeNotifier {
  CategoryDataModel? _selectedCategory;
  int _selectedTabIndex = 0;

  List<Source> _sourceList = [];
  List<Article> _articlesList = [];

  final List<CategoryDataModel> _categoriesList = [
    CategoryDataModel(
      categoryID: "general",
      categoryName: "General",
      categoryImg: "assets/images/general.png",
    ),
    CategoryDataModel(
      categoryID: "business",
      categoryName: "Business",
      categoryImg: "assets/images/business.png",
    ),
    CategoryDataModel(
      categoryID: "sports",
      categoryName: "Sports",
      categoryImg: "assets/images/sports.png",
    ),
    CategoryDataModel(
      categoryID: "technology",
      categoryName: "Technology",
      categoryImg: "assets/images/technology.png",
    ),
    CategoryDataModel(
      categoryID: "entertainment",
      categoryName: "Entertainment",
      categoryImg: "assets/images/enteratiment.png",
    ),
    CategoryDataModel(
      categoryID: "health",
      categoryName: "Health",
      categoryImg: "assets/images/health.png",
    ),
    CategoryDataModel(
      categoryID: "science",
      categoryName: "Science",
      categoryImg: "assets/images/science.png",
    ),
  ];

  CategoryDataModel? get selectedCategory => _selectedCategory;

  List<CategoryDataModel> get categoriesList => _categoriesList;

  List<Source> get sourcesList => _sourceList;

  List<Article> get articlesList => _articlesList;

  void setSelectedSource(int index) {
    _selectedTabIndex = index;

    getAllArticles();

    log("${_selectedTabIndex.toString()} ----- index");
    notifyListeners();
  }

  void onCategoryClicked(CategoryDataModel selectedCategory) {
    _selectedCategory = selectedCategory;

    notifyListeners();
  }

  void goToHome() {
    _selectedCategory = null;
    notifyListeners();
  }

  Future<bool> getAllSources() async {
    try {
      _sourceList = await ApiNetwork.getAllSources(
        _selectedCategory!.categoryID,
      );
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future<void> getAllArticles() async {
    _articlesList = await ApiNetwork.getAllArticles(
      _sourceList[_selectedTabIndex].id,
    );
    notifyListeners();
  }
}
