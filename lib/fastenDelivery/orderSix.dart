import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reataurant/pages/homePage.dart';
class orderSix extends StatefulWidget {
  const orderSix({super.key});
  @override
  State<orderSix> createState() => _orderSixState();
}
class _orderSixState extends State<orderSix> {
  int count = 1;
  String? types;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width:double.infinity,
          color:Color(0xff2A3439),
          child: ListView(
            children:[
              Row(
                children:[
                  IconButton(
                      onPressed:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return HomePage();
                        }), (route) => false);
                      },
                      icon:Icon(
                        Icons.arrow_back,
                        size:25,
                        color:Colors.white,
                      )
                  ),
                ],
              ),
              Container(
                  width:double.infinity,
                  child:Padding(
                    padding: const EdgeInsets.only(bottom:30),
                    child: Image(
                      image:AssetImage("lib/img/salad2.jpg"),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Text(
                    "Mixed salad",
                    style:Theme.of(context).textTheme.headline1
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10,left:15),
                child: Row(
                  children:[
                    Icon(
                        Icons.star,
                        color:Colors.yellow,
                        size:25
                    ),
                    SizedBox(
                        width:5
                    ),
                    Text(
                        "9.6 perfect(180)",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w300,
                          color:Colors.white,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30,left:15),
                child: Row(
                  children:[
                    Text(
                        "220E.g",
                        style:Theme.of(context).textTheme.headline2
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:180),
                      child: CircleAvatar(
                        backgroundColor:Colors.black12,
                        child:IconButton(
                          onPressed:(){
                            setState(() {
                              count++;
                            });
                          },
                          icon:Icon(
                              Icons.add,
                              color:Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:10,
                    ),
                    Text(
                        "$count",
                        style:Theme.of(context).textTheme.headline2
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: CircleAvatar(
                          backgroundColor:Colors.black12,
                          child: IconButton(
                            onPressed:(){
                              setState(() {
                                if(count > 0){
                                  count--;
                                }
                              });
                            },
                            icon:Icon(
                                Icons.remove,
                                color:Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20,left:10),
                child: Text(
                  "Discover the benefits of mixed green salad, a healthy and delicious meal option. Explore different greens, toppings.",
                  style:Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15,left:10),
                child: Text(
                    "Choose Additive",
                    style:Theme.of(context).textTheme.headline1
                ),
              ),
              SizedBox(
                  height:10
              ),
              RadioListTile(
                value:"cream",
                groupValue:types,
                onChanged:(val){
                  setState(() {
                    types = val;
                  });
                },
                controlAffinity:ListTileControlAffinity.trailing,
                activeColor:Color(0xff645394),
                secondary:CircleAvatar(
                  radius:25,
                  backgroundImage:AssetImage("lib/img/rice.jpg"),
                ),
                title:Text(
                    "White Rice",
                    style:TextStyle(
                        fontSize:22,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
              ),
              SizedBox(
                  height:10
              ),
              RadioListTile(
                value:"avocado",
                groupValue:types,
                onChanged:(val){
                  setState(() {
                    types = val;
                  });
                },
                controlAffinity:ListTileControlAffinity.trailing,
                activeColor:Color(0xff645394),
                secondary:CircleAvatar(
                  radius:25,
                  backgroundImage:AssetImage("lib/img/prost.jpg"),
                ),
                title:Text(
                    "Chicken Prost",
                    style:TextStyle(
                        fontSize:22,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
              ),
              SizedBox(
                  height:10
              ),
              RadioListTile(
                value:"tomato",
                groupValue:types,
                onChanged:(val){
                  setState(() {
                    types = val;
                  });
                },
                controlAffinity:ListTileControlAffinity.trailing,
                activeColor:Color(0xff645394),
                secondary:CircleAvatar(
                  radius:25,
                  backgroundImage:AssetImage("lib/img/fries.jpg"),
                ),
                title:Text(
                    "French Fries",
                    style:TextStyle(
                        fontSize:22,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
              ),
              SizedBox(
                  height:8
              ),
              Padding(
                padding: const EdgeInsets.only(right:20,left:20),
                child: MaterialButton(
                  shape:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20),
                      borderSide:BorderSide(
                          color:Color(0xffFF7F50)
                      )
                  ),
                  color:Color(0xffFF7F50),
                  onPressed:(){},
                  child:Padding(
                    padding: const EdgeInsets.only(top:10,bottom:10),
                    child: Text(
                        "Order Now",
                        style:Theme.of(context).textTheme.headline2
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
