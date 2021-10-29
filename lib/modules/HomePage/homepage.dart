import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/model/users/usersmodel.dart';
import 'package:tst_new2/shared/component/navigation.dart';

import '../../provider.dart';
import 'bottomnavigationscreens/screen3.dart';

class Homepage extends StatelessWidget {

  List<BottomNavigationBarItem>items =
  [BottomNavigationBarItem(icon:Icon (Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon:Icon (Icons.favorite_outline),label: 'Favourite')
  ,BottomNavigationBarItem(icon:Icon (Icons.shopping_cart_sharp),label: 'Cart')
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context,model,child){
        return model.product.autos.length == 0 &&model.category.items.length == 0  ?CircularProgressIndicator() :  Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          appBar: AppBar(
            elevation: 0.0,
            title: Text('Welcome'),
            backgroundColor:Color(0xFF030A2F) ,
            actions: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                Model.cartitems.length ==0 ?SizedBox():CircleAvatar(backgroundColor: Colors.redAccent,radius: 10,child: Text('${Model.cartitems.length}'),)
                 , IconButton(onPressed: (){
                    model.bottomnav(model.bottompages.length-1);
                  }, icon: Icon(Icons.shopping_cart_outlined))

                ],
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            type: BottomNavigationBarType.fixed,
            onTap: (index){model.bottomnav(index);},
            currentIndex: model.bottomnavindex,

          ),
          body: model.bottompages[model.bottomnavindex],
        );
      },

    );


  }

}
