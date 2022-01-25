
import 'package:alayniah/models/category.dart';
import 'package:alayniah/models/sub_category.dart';

class sub_Categories {
  List<sub_Category> _subcategories;

  sub_Categories({
    List<sub_Category>subcategories
  })
  {
    this._subcategories = subcategories;
  }
  List<sub_Category> get subcategories => _subcategories;
  set subcategories(List<sub_Category> subcategoriess) => _subcategories = subcategoriess;

  factory sub_Categories.fromJson(List<dynamic> json) => sub_Categories(
      subcategories: List<sub_Category>.from(json.map((x) => sub_Category.fromJson(x))));
}