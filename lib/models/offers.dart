
import 'package:alayniah/models/offer.dart';

class Offers {
  List<Offer> _offers;

  Offers({
    List<Offer>offers
  })
  {
    this._offers = offers;
  }
  List<Offer> get offers => _offers;
  set offers(List<Offer> offerss) => _offers = offerss;

  factory Offers.fromJson(List<dynamic> json) => Offers(
      offers: List<Offer>.from(json.map((x) => Offer.fromJson(x))));
}