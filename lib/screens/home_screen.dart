import 'package:AddressBook/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routename = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Address Book')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}