
// @dart=2.9

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testh/pages/homePage.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var defaultSelected;
String answer;
  final formKey=GlobalKey<FormState>();

  getUser() async{
    var user=FirebaseAuth.instance.currentUser;
    print(user.email);
  }
  @override
  void initState() {
getUser(); 
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Our App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
         IconButton(onPressed: ()async{
           await FirebaseAuth.instance.signOut();
           Navigator.of(context).pushReplacementNamed("login");
         }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body:Center(child: ListView(children: [
      Padding(padding: EdgeInsets.all(20),child: Container(margin: EdgeInsets.only(top: 10),height: 500,decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: 0.6,offset: Offset(10,10))]),
        child: Form(key:formKey,child: Container(padding:EdgeInsets.all(20) ,child: Column(children: [
 
        TextFormField(validator:(val)=>val.isEmpty? 'Enter a valid Code':null ,decoration: InputDecoration(
          hintText:'Code',

          
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
          
          
          ),),
          SizedBox(height: 20),
            TextFormField(validator:(val)=>val.isEmpty? 'Enter a valid libelle':null,obscureText: true,decoration: InputDecoration(
          hintText:'Libelle',
          
          prefixIcon: Icon(Icons.ac_unit),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
          ),),
                    SizedBox(height: 20),

           TextFormField(validator:(val)=>val.isEmpty? 'Enter a valid libelle':null,obscureText: true,decoration: InputDecoration(
          hintText:'Qunatite',
          
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
          ),),
          SizedBox(height: 15,),
           DropdownButtonFormField(hint: Text("Choose The Product"),items: ["Scanner","Imprimante","PC"].map((e) => DropdownMenuItem(child: Text("$e"),value: e)).toList(),
           onChanged: (val){
             setState(() {
               defaultSelected=val;
             });
              validator:(value)=>val==null ?'field required *':null;


           },
           value:defaultSelected),
           SizedBox(height: 15,),
           Row(children: [
             Spacer(),
             Text("Disponible"),
             Radio(value: "oui", groupValue: answer, onChanged: (val){
               setState(() {
                 answer=val;
               });
             }),
             Spacer(),
             Text("Non Disponible"),
             Radio(value: "non", groupValue: answer, onChanged: (val){
               setState(() {
                 answer=val;
               });
             }),
Spacer(),

           ],),
        MaterialButton(onPressed: (){
if(formKey.currentState.validate()){
  formKey.currentState.save();
}
        },
        child: Text("valider"),)   
        ],),)
        
        ),
        
        ),
       
       ) ],)),
      
    );
  }
}


 


