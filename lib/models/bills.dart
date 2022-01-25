
import 'package:alayniah/models/bill.dart';

class Bills {
  List<Bill> _bills;

  Bills({List<Bill> bills}) {
    this._bills = bills;
    if (bills == null) {
      this._bills = new List<Bill>();
    }
  }
  List<Bill> get bills => _bills;
  set bills(List<Bill> billss) => _bills = billss;

  factory Bills.fromJson(List<dynamic> json) => Bills(
      bills: List<Bill>.from(json.map((x) => Bill.fromJson(x))));
}