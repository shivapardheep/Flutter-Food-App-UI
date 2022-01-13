import 'package:flutter/material.dart';
import 'package:login_ui_testing/constantpage.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodOne extends StatefulWidget {
  const FoodOne({Key? key}) : super(key: key);

  @override
  _FoodOneState createState() => _FoodOneState();
}

class _FoodOneState extends State<FoodOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Image.asset(
                      "asserts/share.png",
                      color: Colors.white,
                      height: 20,
                      width: 20,
                      matchTextDirection: true,
                    ),
                  ),
                  Image.asset(
                    "asserts/dots.png",
                    color: Colors.white,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: Colors.grey,
              image: DecorationImage(
                  image: AssetImage("asserts/foodsIcon/burgar.png"),
                  fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Container(
              height: size.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: const [
                          Icon(Icons.location_on, color: Colors.grey),
                          Text(
                            "  karaikudi",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cheese Burgar",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SmoothStarRating(
                                    borderColor: primarycolor,
                                    starCount: 5,
                                    rating: 3.5,
                                    // size: 20,
                                    color: primarycolor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      "125 reviews",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ClipPath(
                            clipper: ClipCreator(),
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: primarycolor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                child: Text(
                                  "₹200",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Container(
                        child: const Text(
                          "Burger meat is the rich protein source, especially when it comes to Chapps' top notch beef. Protein presents your body's source of energy, it builds muscle as well as gives structure to the cells. Depending on their lifestyle and diet, people need between 50 and 175 grams of protein per day.",
                          style: TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                            // wordSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          Text(
                            "Order Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipCreator extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreheight = 20;
    path.lineTo(0, size.height - ignoreheight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreheight);
    path.lineTo(size.width, 0);
    path.close();

    return path;
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    throw UnimplementedError();
  }
}
