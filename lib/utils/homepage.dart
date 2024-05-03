import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:re_exam/utils/global.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.account_circle_rounded)],
      ),
      body: Column(
        children: [
          Divider(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text(
                    'search for item ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(CupertinoIcons.mic)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170, top: 10),
            child: Text(
              'Explore',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Wrap(
            children: [
              ...List.generate(
                  product.length,
                      (index) => InkWell(onTap: () {
                    setState(() {
                      selectindex=index;
                      Navigator.of(context).pushNamed('/details');
                    });
                  },
                    child: homep(
                      img: product[index]['img'],
                      name: product[index]['name'],
                      price: product[index]['price'],
                    ),
                  ))
              //
            ],
          )
        ],
      ),
    );
  }

  Container homep(
      {required String img, required String name, required int price}) {
    return Container(
      margin: EdgeInsets.only(left: 5),

      height: 240,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 150,
            width: 140,
            decoration: BoxDecoration(
                image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(img)),
                ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          Row(

            children: [
              Text(
                '$price',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(width: 40,),
              IconButton.filled(
                  onPressed: () {

                    // cart.add(product[selectindex]);
                    setState(() {
                      bool st=false;
                      int index=0;;
                      for(int i=0;i<cartlist.length;i++)
                      {
                        st=true;
                        index=i;

                      }
                      if(st)
                      {
                        cartlist[index]['qty']++;
                      }
                      else
                      {
                        cartlist.add(product[selectindex]);
                        st=false;
                      }

                    });
                    Navigator.of(context).pushNamed('/cart');

                  },
                  icon: Icon(
                    CupertinoIcons.add,
                    size: 20,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
int selectindex=0;
