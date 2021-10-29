import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/modules/HomePage/homepage.dart';
import 'package:tst_new2/modules/SplashScreen/splashanimation.dart';
import 'package:tst_new2/modules/pageview/page1.dart';
import 'package:tst_new2/provider.dart';
import 'package:tst_new2/shared/component/Button.dart';
import 'package:tst_new2/shared/component/textformfield.dart';
import 'package:tst_new2/shared/endpoints/end.dart';

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) {
        double heig = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF030A2F),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    height: heig * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xFF030A2F),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50))),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                  Container(
                    color: Color(0xFF030A2F),
                    child: Container(
                   //   padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            LottieBuilder.asset(
                              Aniamtions.page5,
                              width: w,
                              fit: BoxFit.fill,
                            ),
                            textformfield(
                                pass: email,
                                radius: 10,
                                validator: (value){
                                 if(value.toString().isEmpty) return 'Please enter  your email';
                                //  else if(!value.toString().endsWith('@gmail.com')) return 'Email must end with @gmail.com';
                                },
                                prefix_icon: Icon(Icons.person),
                                keyboard_type: TextInputType.text,
                                text: 'Email'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: textformfield(
                                  pass: controller2,
                                  radius: 10,
                                  validator: (value){
                                   if(value.toString().isEmpty) return 'Enter Password please';
                                    else if(value.toString().length < 4) return 'Password is too short';

                                  },
                                  suffix_icon: Icons.remove_red_eye_outlined,
                                  prefix_icon: Icon(Icons.lock_outline),
                                  keyboard_type: TextInputType.text,
                                  text: 'Password'),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                           !model.loading ?  DefaultButton(
                              text: 'Login',
                              controll: (){
                                if(formkey.currentState!.validate()) {
                                  model.login_(context: context,email: email.text.toString(),password: controller2.text.toString()) ;
                                }
                              }
                            ) : CircularProgressIndicator()

                            , Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('Don\`t have Account'),
                                TextButton(
                                    onPressed: () {
                                      //  navigation(context:context,Widget:  Shop_register());
                                    },
                                    child: Text('Register now'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
