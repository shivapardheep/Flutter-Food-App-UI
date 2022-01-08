//food icons
import 'constantpage.dart';

class foodiconModel {
  String image;
  String title;
  foodiconModel({required this.image, required this.title});
}

List<foodiconModel> icondata = [
  foodiconModel(image: offer, title: "Offer"),
  foodiconModel(image: pizza, title: "Pizza"),
  foodiconModel(image: burgar, title: "Burgar"),
  foodiconModel(image: drinks, title: "Drinks"),
  foodiconModel(image: frenchfries, title: "French-fries"),
];
