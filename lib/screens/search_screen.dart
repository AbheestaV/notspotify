import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  String? _search;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(labelText:"Search"),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Khaali kyu chora';
          }
          return null;
        },
        onSaved: (value)=>_search=value,
      ),
    );
  }
}


/*

TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) => _email = value,
            ),


* */