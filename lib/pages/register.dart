// @dart=2.9

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Register extends StatefulWidget {
  const Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
var myPass,MyEmail,phone;
signup() async{
var formdata=formKey.currentState;
  if(formdata.validate()){
    formdata.save();
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: MyEmail,
    password: myPass
  );
  return userCredential;
  print("valid");
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  
print(e);
  }
  }}
  
    final TextEditingController _pass = TextEditingController();


  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

   var mdw=MediaQuery.of(context).size.width;
   var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(height: double.infinity,width: double.infinity),
        positioned(mdw),
        positionedTop(mdw),
        Container(height:1000,child: SingleChildScrollView(child: Column(children: [
    
        SizedBox(height: 12,),
        avatar(mdw),
       formmethod(mdw),
       SizedBox(height: 17),
       Container(child: Column(children: [
         
         Padding(
           padding: const EdgeInsets.symmetric(horizontal:40),
           child: MaterialButton(onPressed:() async{
      UserCredential Response=   await signup();
      if(Response!=null){
        Navigator.of(context).pushReplacementNamed("Home");
      }else{
        print("Sign up");
      }
           } ,
           child:Text('Register',style: TextStyle(fontFamily: 'Popiins',fontSize: 15,color:Colors.white70),),
           minWidth:double.infinity ,color: Colors.grey[800],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
            
         ),
         SizedBox(height: 10,),
         InkWell(onTap:(){
           Navigator.of(context).pop();
         } ,child: Text("Aleady Had An Account",style: TextStyle(fontSize: 17,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),)
        
         
       ],),)
        ],),),
       )
      ],),
    );
  }

  Center formmethod(double mdw) {
    return Center(
       child: Container(margin: EdgeInsets.only(top: 40),height: 300,width: mdw/1.3,decoration: BoxDecoration(color: Colors.white,
       boxShadow:[ BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius:0.6 ,offset: Offset(10,1)),
       
       ]),
       child: Form(key:formKey,child: Container(padding: EdgeInsets.all(20),child: Column(children: [
         Spacer(),
        TextFormField( onSaved:(val){
          MyEmail=val;
        } ,validator:(val)=>val.isEmpty? 'Enter a valid Email':null ,decoration: InputDecoration(
          hintText:'Email',

          
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
          
          
          ),),
          Spacer(),
            TextFormField(controller: _pass,onSaved:(val){
              myPass=val;
            },validator:(val)=>val.isEmpty? 'Enter a valid Password':null,obscureText: true,decoration: InputDecoration(
          hintText:'Password',
          
          prefixIcon: Icon(Icons.ac_unit),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
          
          
          ),),
          Spacer(),
           TextFormField(onSaved:(val){
              myPass=val;
            },validator:(val)=>val!=_pass.text? 'Imcompatible Pass':null,obscureText: true,decoration: InputDecoration(
          hintText:'Confirm Password',
          
          prefixIcon: Icon(Icons.ac_unit),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
          
          
          ),),
          Spacer(),
               TextFormField(onSaved:(val){
                 phone=val;
               },validator:(val)=>val.isEmpty? 'Enter a valid Phone Number':null,decoration: InputDecoration(
          hintText:'Phone Number',
          
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
          
          
          ),),
          Spacer(),
   

       
       ],),)),
       ),
       );
  }

  Container avatar(double mdw) {
    return
        Container(height: 100,
        width: 100,
        margin:EdgeInsets.only(top:80),
        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(blurRadius: 10,color: Colors.black)
        ]
        ),
        child: Stack(children:[ 
          Positioned(top:30,right:30,
          child: Icon(Icons.person,color: Colors.grey[800],size: 40),),
          Positioned(top:40,right:10,child:Icon(Icons.forward,color: Colors.grey[800],)
        
        
        )]),
        
        );
  }

  Positioned positioned(double mdw) {
    return Positioned(
        child: Transform.scale(
          scale: 1.5,
          child: Transform.translate(
            offset: Offset(0,-mdw/1.8),
            child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(mdw),color: Colors.grey[800]),
            width: mdw,
            height: mdw,
            ),
          ),
        ));
  }

  Positioned positionedTop(double mdw) {
    return Positioned(
      top: 320,
      right: 220,
      child: Container(
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(mdw),color: Colors.blue[800]?.withOpacity(0.3)),
            width: mdw,
            height: mdw));
  }
}