import 'package:crypto_app_pi/aboutMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class sideBar extends StatelessWidget {
  const sideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hi User...'),
            accountEmail: Text('Welcome to Cryptolist App'),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/bitcoin.jpg'),
            )),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Me'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => aboutMe()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
