import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final void Function() ontap;
  final String text;
  const DrawerPage({Key? key, required this.ontap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'translate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.translate),
            title: Text(text),
            onTap: ontap,
          ),
        ],
      ),
    );
  }
}
