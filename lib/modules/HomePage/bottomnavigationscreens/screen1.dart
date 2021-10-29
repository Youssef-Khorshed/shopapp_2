import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/modules/productpage/productpage.dart';
import 'package:tst_new2/shared/component/navigation.dart';
import 'package:tst_new2/shared/endpoints/end.dart';

import '../../../provider.dart';

class BottomScreen1 extends StatelessWidget {
  const BottomScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: model.category.items.length>0 &&model.product.autos.length>0 ?
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*0.1,
                  decoration: BoxDecoration(
                      color: Color(0xFF030A2F),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
                Container(
                  color: Color(0xFF030A2F),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:Column(
                      children: [
                        Container(
                          height: 50,
                          child: ListView.separated(itemBuilder: (context,index)=>
                           catitem(index, model)   ,  separatorBuilder: (context,index)=>SizedBox(width: 5,)
                              , itemCount: model.category.items.length
                          ,scrollDirection:Axis.horizontal ,
                          ),
                        )

                         ,

                           GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 2.3,
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                          itemBuilder: (context, index) => griditem(index, model,context),
                          itemCount: model.product.autos.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ) : Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }

  Widget griditem(int index, Model model,context) {
    return  InkWell(
      onTap: (){
        animated_navigation(context: context, widget: Productpage(item: model.product.autos[index]),);
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage('${model.product.autos[index].image}')),
            Text(
              '${model.product.autos[index].title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text('Price  ${model.product.autos[index].price}',style: TextStyle(fontWeight: FontWeight.bold)),
            RatingBar.builder(
              initialRating: model.product.autos[index].rating.rate.toDouble(),
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
              onRatingUpdate: (rating) {},
              ignoreGestures:true ,
            ),

          ],
        ),
      ),
    );
  }
  Widget catitem(int index , Model model)
  {

    return InkWell(
    onTap: (){
      model.getproducts(model.category.items[index] == 'All'? "" : "/category/${model.category.items[index]}");
      model.changeitemtabcolor(current: index);last =index;
    },
    child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: model.colors[index],
              borderRadius:
              BorderRadius.all(Radius.circular(50))),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Text('${model.category.items[index]}',style:
          TextStyle(fontSize: 20,color: Colors.white),)
      ),
  );
    

  }


}
