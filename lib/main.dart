import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tst_new2/provider.dart';
import 'package:tst_new2/shared/endpoints/end.dart';
import 'package:tst_new2/shared/network/dio.dart';
import 'package:tst_new2/shared/network/local/preference.dart';
import 'mainpage.dart';
import 'model/users/usersmodel.dart';
import 'modules/HomePage/homepage.dart';
import 'modules/LoginScreen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.intial();
  DioHelper.intial();
  token = Preference.get(key: 'token');
  pass_page_view = Preference.get(key: 'pass');
  List<String>?list = Preference.geter(key: 'cart');
  List<String>?list2 = Preference.geter(key: 'favourite');
  list?.forEach((element) {
    Model.cartitems.add( Autogenerated.fromprefrence( json.decode(element)));
  });
  list2?.forEach((element) {
    Model.favitems.add( Autogenerated.fromprefrence( json.decode(element)));
  });
//  print(Model.favitems.length);

  if(pass_page_view != null) {
    nextpage = Login();
    if (token != null){
      nextpage = Homepage();
    }
  }
  runApp( DevicePreview(builder: (context)=>MyApp(),) );
}

