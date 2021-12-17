import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/modules/LoginScreen/login.dart';
import 'package:tst_new2/shared/component/navigation.dart';
import 'package:tst_new2/shared/endpoints/end.dart';
import 'package:tst_new2/shared/network/local/preference.dart';
import 'package:tst_new2/shared/smoothpage.dart';

import '../../provider.dart';

class Pageview1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) {
        double h = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFFFAFAFA),
            actions: [
              TextButton(
                  onPressed: () {
                    navigation(context: context, widget: Login());
                    Preference.put(key: 'pass', value: true)
                        .then((value) => null);
                  },
                  child: Text('Skip'))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LottieBuilder.asset(model.page[model.pageindex],
                      width: w, height: h * (0.45), fit: BoxFit.fill),
                  Container(
                    height: 10,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          smooth(index, model.pageindex),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      itemCount: model.page.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.3,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: model.visible,
                        child: TextButton(
                            onPressed: () {
                              if (model.pageindex == 1) {
                                model.invisibleback();
                                model.prevoispage();
                              } else if (model.pageindex > 0) {
                                model.visibleback();
                                model.prevoispage();
                              }
                            },
                            child: Text('Back')),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          if (model.pageindex == 2) {
                            Preference.put(key: 'pass', value: true)
                                .then((value) => null);
                            navigation(context: context, widget: Login());
                          } else {
                            model.visibleback();
                            model.nextpage();
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios_sharp),
                      )
                    ],
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
