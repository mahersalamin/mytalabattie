import 'package:flutter/material.dart';
import 'package:mytalabat_app/FavouriteModel.dart';
import 'package:provider/provider.dart';

import 'RestaurantMenu.dart';

class testwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Favorite List"),
        ),
        body: Column(
          children: [
            Consumer<FavModel>(
                builder: (context, todo  , child){
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: todo.list.length,
                    itemBuilder: (context , index){
                      return ListTile(
                        leading: Image.network(
                            'http://appback.ppu.edu/static/${todo.list[index].menuImage}',
                            width: MediaQuery.of(context).size.width/3, fit:BoxFit.cover),
                        title: Text(todo.list[index].menuName),
                        subtitle: Text(todo.list[index].menuPrice.toString()),
                        trailing: IconButton(
                            icon:Icon(Icons.delete_forever),
                            color: Colors.red,
                            onPressed: (){
                              Provider.of<FavModel>(context).remove(index);
                            }
                        ),
                      );
                    },
                  );
                }
            )
          ],
        )
    );
  }
}