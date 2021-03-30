import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mega_store/services/AuthService.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    final AuthService _auth = AuthService();

    Widget _createDrawerItem(
        {IconData icon, String text, GestureTapCallback onTap}) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
              ),
            )
          ],
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Vx.white,
            ),
            accountName: "${user.displayName}".text.xl2.bold.make(),
            accountEmail: "${user.email}".text.xl2.bold.make(),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Vx.blue900,
              child: user.photoURL == null
                  ? Icon(
                      Icons.person,
                      size: 40,
                    )
                  : Image(
                      image: NetworkImage('${user.photoURL}'),
                    ),
            ),
          ),
          _createDrawerItem(
              icon: Icons.person_pin, text: "Profile", onTap: () {}),
          _createDrawerItem(
              icon: Icons.person_pin,
              text: "Sign Out",
              onTap: () async {
                await _auth.signOut();
              }),
        ],
      ),
    );
  }
}
