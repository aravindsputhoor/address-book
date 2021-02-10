import 'package:AddressBook/models/address_list.dart';
import 'package:AddressBook/models/respose.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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

  List<Datum> _addressList = [];
  List<Datum> get addressListData {
    return [..._addressList];
  }

  Future fetchAllAddress() async {
    const url = 'https://addressbook.digitque.com/all-address';
    final response = await http.get(url);
    List<Datum> _loadedAddressList;

    final String responseString = response.body;
    final extractedFullData = addressListFromJson(responseString);
    if (extractedFullData.status == '1') {
      final extractedData = extractedFullData.data;

      extractedData.forEach((data) {
        _loadedAddressList.add(Datum(
          id: data.id,
          name: data.name,
          email: data.email,
          address: data.address,
          status: data.status,
        ));
      });
      _addressList = _loadedAddressList;
      return 1;
    } else {
      return 2;
    }
  }
}
