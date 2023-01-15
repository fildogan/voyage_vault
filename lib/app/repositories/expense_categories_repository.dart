import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/models/expense_category_model.dart';

class ExpenseCategoriesRepository {
  //List of categories for expenses
  final List<ExpenseCategoryModel> _categoryList = [
    ExpenseCategoryModel('transportation', const Icon(Icons.directions_car)),
    ExpenseCategoryModel('food', const Icon(Icons.fastfood)),
    ExpenseCategoryModel('accomodation', const Icon(Icons.hotel)),
    ExpenseCategoryModel('entertainment', const Icon(Icons.local_movies)),
    ExpenseCategoryModel('shopping', const Icon(Icons.shopping_cart)),
    ExpenseCategoryModel('miscellaneous', const Icon(Icons.more_horiz)),
    ExpenseCategoryModel('tickets', const Icon(Icons.museum)),
  ];

  //Returns the number of categories
  int categoryListLength() => _categoryList.length;

  //Returns the title of a category by its index
  String getCategoryTitle({required int categoryListIndex}) =>
      _categoryList[categoryListIndex].categoryTitle;

  //Returns the icon of a category by its index
  Icon getCategoryIcon({required int categoryListIndex}) =>
      _categoryList[categoryListIndex].categoryIcon;

  //Returns the list of categories
  List<ExpenseCategoryModel> getCategoryList() => _categoryList;

  //Returns the list of category titles
  List<String> getCategoryTitleList() =>
      _categoryList.map((category) => category.categoryTitle).toList();

  //Returns the index of a category by its title
  int getCategoryIndexByTitle(String categoryTitle) {
    final category = _categoryList.firstWhere(
      (element) => element.categoryTitle == categoryTitle,
    );
    return _categoryList.indexOf(category);
  }

  //Checks if the chosen category exists in the list
  bool isCategoryExists(String categoryTitle) {
    return _categoryList
        .any((element) => element.categoryTitle == categoryTitle);
  }
}
