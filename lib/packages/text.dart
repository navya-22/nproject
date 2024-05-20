import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nproject/packages/text2.dart';
import 'package:nproject/services/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextPage extends StatefulWidget {
  TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();


}

class _TextPageState extends State<TextPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namecontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _namecontroller,
                  validator: (value) {
                  if(value == null || value.isEmpty){
                    return('please enter your name ');
                  }
                  return null;
                },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (value) {
                    RegExp regex=
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                   if( value!.isEmpty){
                     return('please enter your email');
                   }else{
                     if(!regex.hasMatch(value)){
                       return ' please enter a valid email';
                     }
                   }
                   return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  validator: (value) {
                    RegExp regex=
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&~]).{8,}$');
                    if(value!.isEmpty){
                      return ('please enter the Password');
                    }else{
                      if(!regex.hasMatch(value)){
                        return'enter a valid Password';
                      }
                    }
                    return null ;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'password'),
                ),
                const SizedBox(
                  height: 20,
                ),


                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      savename(name: _namecontroller.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('click'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
