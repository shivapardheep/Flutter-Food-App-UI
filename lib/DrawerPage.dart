import 'package:flutter/material.dart';
import 'package:login_ui_testing/constantpage.dart';
import 'package:login_ui_testing/food.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    double dvheight = MediaQuery.of(context).size.height;
    double dvwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Ink(
        height: dvheight,
        width: dvwidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
        ),
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    "https://english.cdn.zeenews.com/sites/default/files/styles/zm_700x400/public/2021/10/13/978907-majackma.png"),
                // radius: 60,
              ),
              decoration: BoxDecoration(color: Colors.transparent),
              // margin: EdgeInsets.all(10),
              accountName: Text("Sivaram.PR"),
              accountEmail: Text("ram614709@gmail.com"),
            ),
            listTileCall(title: 'Orders', iconName: Icons.border_color),
            listTileCall(title: 'Address', iconName: Icons.location_on),
            listTileCall(title: 'Notification', iconName: Icons.notifications),
            listTileCall(title: 'Help', iconName: Icons.help),
            listTileCall(title: 'About', iconName: Icons.info),
            listTileCall(title: 'Rate Us', iconName: Icons.star_half_outlined),
            listTileCall(title: 'logout', iconName: Icons.logout),
          ],
        ),
      ),
    );
  }
}

class listTileCall extends StatelessWidget {
  final IconData iconName;
  final String title;

  const listTileCall({Key? key, required this.iconName, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            iconName,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        title.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
