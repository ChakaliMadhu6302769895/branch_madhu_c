
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:branch_madhu_c/SecondScreen.dart';

void main(){
  runApp(
      MaterialApp(
          home:MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:MyCustomForm(),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {

  @override
  State<MyCustomForm> createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  @override

  final _formkey = GlobalKey <FormState> ();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  get buttonenabled => true;
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child:Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 220, 270 , 10),
            child: Text('Register' , style: TextStyle(fontSize: 30),),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 18),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                  },
                  child: Text("Sign in"),
                ),
              ],
            ),
          ),


          Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: ("Email")
              ),
              validator: (value){
                if(value==null ||value.isEmpty){
                  return "Enter Email";
                }

                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                if(!emailValid) {
                  return "Enter Valid Email";
                }

              },

            ),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: ("Password")
              ),

              validator: (value){
                if(value!.isEmpty) {
                  return "Enter Password";
                }
                else if(passwordController.text.length<8){
                  return "Atleast 8 characters";
                }
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: ("Confirm password")
              ),

              validator: (value){
                if(value!.isEmpty) {
                  return "Password Should Not Match";
                }
                else if(passwordController.text.length<8){
                  return "Atleast 8 characters";
                }
              },

            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(500, 40),
              ),
              onPressed: buttonenabled?(){

                if (_formkey.currentState!.validate()) {
                  emailController.clear();
                  passwordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('REGISTRATION SUCCESSFUL..')),
                  );
                }

              } :null,
              child: Text("Register"),
            ),
          ),
        ],
      ),
    );
  }
}