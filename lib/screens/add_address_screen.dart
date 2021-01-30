import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
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
              ),
              Container(
                height: 30,
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: _saveForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
