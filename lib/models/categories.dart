
import 'package:alayniah/models/category.dart';

class Categories {
  List<Category> _categories;

  Categories({
    List<Category>categories
  })
  {
    this._categories = categories;
  }
  List<Category> get categories => _categories;
  set categories(List<Category> categoriess) => _categories = categoriess;

  factory Categories.fromJson(List<dynamic> json) => Categories(
      categories: List<Category>.from(json.map((x) => Category.fromJson(x))));
}