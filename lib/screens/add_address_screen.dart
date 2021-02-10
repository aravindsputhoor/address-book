import 'package:AddressBook/models/respose.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:AddressBook/providers/address.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAddressScreen extends StatefulWidget {
  static const routeName = '/addaddress';

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _addressdata = AddressData(
    name: '',
    address: '',
    email: '',
  );

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _addressFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    _form.currentState.save();

    final ResposeData response =
        await Provider.of<Address>(context, listen: false)
            .addAddress(_addressdata);
    if (response.status == '1') {
      print(response.msg);
      // Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.status == '2') {
      print(response.msg);
    } else {
      print(response.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Address')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                focusNode: _nameFocusNode,
                decoration: InputDecoration(labelText: 'Name'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_addressFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addressdata = AddressData(
                    name: value,
                    address: _addressdata.address,
                    email: _addressdata.email,
                  );
                },
              ),
              TextFormField(
                focusNode: _addressFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                decoration: InputDecoration(labelText: 'Address'),
                maxLines: 3,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Address';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addressdata = AddressData(
                    name: _addressdata.name,
                    address: value,
                    email: _addressdata.email,
                  );
                },
              ),
              TextFormField(
                focusNode: _emailFocusNode,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Email Address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addressdata = AddressData(
                    name: _addressdata.name,
                    address: _addressdata.address,
                    email: value,
                  );
                },
              ),
              Container(
                height: 30,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text('Submit'),
                      onPressed: _saveForm,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
