import 'package:flutter/material.dart';
import 'package:re_exam/utils/global.dart';


import 'homepage.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(onTap: () {
          Navigator.of(context).pop();


        },child: Icon(Icons.arrow_back_ios)),
        title: Text(' detailspage'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(

                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          product[selectindex]['img']
                      )
                  ),

                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            Text(product[selectindex]['price'].toString(),style: TextStyle(
              color: Colors.orange,fontSize: 30,

            ),),

            SizedBox(width: 150,),
            Row(
              children: [
                Text(product[selectindex]['name'].toString(),style: TextStyle(color: Colors.blue,fontSize: 20),),
                SizedBox(width:  129,),
                Text('⭐⭐⭐⭐ ',style: TextStyle(
                    fontSize: 10
                ),),
                Text('4.5 ',style: TextStyle(
                    fontSize: 10
                ),),
              ],
            ),

            SizedBox(height: 149,),

            Container(
              height: 40,
              width: double.infinity,
              child: FloatingActionButton(onPressed: () {

                setState(() {
                  bool st=false;
                  int index=0;

                  for(int i=0;i<cartlist.length;i++)
                  {

                    if(cartlist[i]['name'] == product[selectindex]['name'])
                    {
                      st= true;
                      index=i;
                    }

                  }
                  if(st)
                  {
                    cartlist[index]['qty']++;
                  }
                  else
                  {
                    cartlist.add(product[selectindex]);
                  }

                });
                Navigator.of(context).pushNamed('/cart');

              },child: Text('+ add to cart',style: TextStyle(
                  fontSize: 20
              ),),),
            )
          ],
        ),
      ),
    );
  }
}
