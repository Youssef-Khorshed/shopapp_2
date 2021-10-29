import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/model/users/usersmodel.dart';
import 'package:tst_new2/modules/productpage/productpage.dart';
import 'package:tst_new2/shared/component/navigation.dart';

import '../../../provider.dart';

class BottomScreen2 extends StatelessWidget {
  const BottomScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Consumer<Model>(builder: (context,model,child){
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height*0.1,
                decoration: BoxDecoration(
                    color: Color(0xFF030A2F),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50)
                    )),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              )
              , Container(
                color: Color(0xFF030A2F),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50)
                      )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Column(
                    children: [
                      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1/2.3,
                      ),
                          itemBuilder:(context,index)=>griditem(index,model,context),itemCount:  Model.favitems.length
                        ,shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      )
                      , Row(
                        children: [
                          Spacer()
                          ,TextButton(onPressed: (){
                            model.favclear();
                          }, child: Text('Clear')),
                        ],
                      )

                    ],
                ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
  Widget griditem(int index, Model model,context) {
    return  InkWell(
      onTap: (){
        animated_navigation(context: context, widget: Productpage(item: Model.favitems[index]  ),);
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage('${Model.favitems[index].image }')),
            Text(
              '${Model.favitems[index].title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text('Price  ${Model.favitems[index].price}'),
            RatingBar.builder(
              initialRating: Model.favitems[index].rating.rate.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 3,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                size: 10,
                color: Colors.amber,
              ),
              ignoreGestures:true ,
              onRatingUpdate: (rating) {},
            ),

          ],
        ),
      ),
    );
  }


}
