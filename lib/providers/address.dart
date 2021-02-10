import 'package:AddressBook/models/respose.dart';
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
  Future<ResposeData> addAddress(AddressData address) async {
    const url = 'https://addressbook.digitque.com/add-address';

    final response = await http.post(url, body: {
      'name': address.name,
      'address': address.address,
      'email': address.email
    });

    final String responseString = response.body;

    return resposeDataFromJson(responseString);

    // final extractedData = json.decode(response.body) as Response;
    // print(extractedData);

    // print(json.decode(response.body));
  }
}
