import 'package:flutter/material.dart';
import 'package:re_exam/utils/global.dart';


class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0; i<cartlist.length; i++)
    {
      total = (total+cartlist[i]['price']).toInt();

    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                Text('total  = $total ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            )
          ],
        ),



      ),
      appBar: AppBar(
        leading: InkWell(onTap: () {
          Navigator.of(context).pop();
        },child: Icon(Icons.arrow_back_ios)),
      ),
      body:  SingleChildScrollView(
        child: Column(

            children: [
              Divider(
                height: 10,
              ),
              ...List.generate(cartlist.length, (index) =>  Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 180,
                    width: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              cartlist[index]['img'],
                            )
                        ),

                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Column(
                    children: [
                      Text(cartlist[index]['name']),
                      Text(cartlist[index]['price'].toString()),
                      Row(
                        children: [
                          InkWell(onTap: () {
                            setState(() {
                              if(cartlist[index]['qty']>1)
                              {
                                cartlist[index]['qty']--;
                                total=(total-cartlist[index]['price']).toInt();
                              }
                            });
                          },child: Icon(Icons.remove)),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                            ),
                            child: Text('${cartlist[index]['qty']}',),
                          ),
                          InkWell(onTap: () {
                            setState(() {
                              cartlist[index]['qty']++;
                              total=(total+cartlist[index]['price']).toInt();

                            });
                          },child: Icon(Icons.add)),

                        ],
                      ),
                      InkWell(onTap: () {
                        setState(() {

                          cartlist[index]['qty'] = 1;
                          cartlist.removeAt(index);
                          if(cartlist.length==0)
                          {
                            total=0;
                          }
                          else{
                            total=(total-cartlist[index]['price']).toInt();
                          }

                        });


                      },child: Icon(Icons.delete))
                    ],
                  )
                ],

              )
              ),

            ]
        ),
      ),


    );

  }
}
int total=0;
int a=1;

