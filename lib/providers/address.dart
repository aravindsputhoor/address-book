import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AddressData {
  final String name;
  final String address;
  final String email;

  AddressData({
    @required this.name,
    @required this.address,
    @required this.email,
  });
}

class Address with ChangeNotifier {
  Future<void> addAddress(AddressData address) {}
}
