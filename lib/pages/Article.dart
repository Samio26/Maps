import 'package:flutter/material.dart';

class Article{
  String lib="";
  num code=0;
  double qte;
  Article({this.lib="",this.code=0,this.qte=0.0});
  get Lib=> this.lib;
  get Qte=>this.qte;
  get Code=>this.code;

  set Lib(_lib){
    lib=_lib;
  }
  set Code(_code){
    code=_code;
  }
  set Qte (_qte){
    qte=_qte;
  }
}