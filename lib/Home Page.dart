import 'package:flutter/material.dart';
import 'package:login_ui_testing/DrawerPage.dart';
import 'package:login_ui_testing/constantpage.dart';

import 'food icons.dart';
import 'food popular.dart';
import 'food.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double valueofX = 0.0;
  double valueofY = 0.0;
  double scalevalue = 1;
  double radiusValue = 1.0;
  bool togglevalue = false;
  late AnimationController myAnimation;

  @override
  void initState() {
    myAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double dvheight = MediaQuery.of(context).size.height;
    double dvwidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(valueofX, valueofY, 0)
            ..scale(scalevalue),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radiusValue),
            child: Scaffold(
              appBar: AppBar(
                leading: Center(
                  child: InkWell(
                    onTap: () {
                      togglevalue = !togglevalue;
                      if (togglevalue) {
                        valueofX = 200.0;
                        valueofY = 80.0;
                        radiusValue = 20.0;
                        scalevalue = 0.8;
                        myAnimation.forward();
                      } else {
                        valueofX = 0.0;
                        valueofY = 0.0;
                        radiusValue = 1.0;
                        scalevalue = 1;
                        myAnimation.reverse();
                      }
                      setState(() {});
                    },
                    child: AnimatedIcon(
                        size: 35,
                        icon: AnimatedIcons.menu_arrow,
                        color: Colors.black,
                        progress: myAnimation),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Delivering to",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black45),
                    ),
                    InkWell(
                      // focusColor: Colors.green,
                      onTap: () {
                        print("Location Clicked");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Current Location",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: primarycolor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Ink(
                              height: 45,
                              // width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  print("called...");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search),
                                      Text(
                                        "Search Foods",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                            color: primarycolor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          "Category",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 115,
                        // color: Colors.black,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: icondata.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue.withOpacity(0.15),
                                      ),
                                      margin: EdgeInsets.all(10),
                                      height: 70,
                                      width: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: Image.asset(
                                            icondata[index].image.toString()),
                                      ),
                                    ),
                                    onTap: () {
                                      print(icondata[index].title.toString());
                                    },
                                  ),
                                  Text(icondata[index].title.toString()),
                                ],
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Popular",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int i = 0; i < populardata.length; i++) ...{
                        InkWell(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => FoodOne()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 270,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: Offset(5, 5)),
                              ],
                              color: Colors.grey.shade200,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  // width: 00,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(populardata[i].popimage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    populardata[i].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: primarycolor,
                                    ),
                                    Text(
                                      populardata[i].star.toString(),
                                      style: TextStyle(color: primarycolor),
                                    ),
                                    Text(
                                      " (${populardata[i].rating} ratings)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${populardata[i].name} - ₹${populardata[i].price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//togglevalue = !togglevalue;
//                     if (togglevalue) {
//                       valueofX = 200.0;
//                       valueofY = 80.0;
//                       radiusValue = 20.0;
//                       scalevalue = 0.8;
//                     } else {
//                       valueofX = 0.0;
//                       valueofY = 0.0;
//                       radiusValue = 1.0;
//                       scalevalue = 1;
//                     }
//                     setState(() {});
