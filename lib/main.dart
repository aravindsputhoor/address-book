import 'package:AddressBook/providers/address.dart';
import 'package:AddressBook/screens/add_address_screen.dart';
import 'package:AddressBook/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Address(),
        ),
      ],
      child: MaterialApp(
        title: 'Address Book',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          fontFamily: 'Semibold',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          AddAddressScreen.routeName: (ctx) => AddAddressScreen(),
        },
      ),
    );
  }
}
