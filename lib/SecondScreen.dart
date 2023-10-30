import 'package:branch_madhu_c/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(SecondScreen());
}

class SecondScreen extends StatelessWidget {

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Myhome()
      ),
    );
  }
}

class Myhome extends StatefulWidget{
  @override
  State<Myhome> createState() => _MyHomeState();

}

class _MyHomeState  extends State<Myhome>{

  final _formkey = GlobalKey<FormState>();

  get buttonenabled => true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 220, 285, 20),
              child: Text('Sign in' , style: TextStyle(fontSize: 30),)
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 18),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: (){},
                  child: Text("Register"),
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
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
              decoration: InputDecoration(
                  labelText: ("Password")
              ),
              validator: (value){
                if(value==null ||value.isEmpty){
                  return "Enter Password";
                }
                return null;
              },
            ),
          ),



          Padding(padding: EdgeInsets.fromLTRB(250, 10, 0, 10),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SecondScreen()));
            },
              child: Text("Forgot password?"),
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

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('REGISTRATION SUCCESSFUL..')),
                  );
                }

              } :null,
              child: Text("Sign in"),
            ),
          ),

        ],
      ),
    );
  }
}