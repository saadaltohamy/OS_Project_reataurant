import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reataurant/auth/login.dart';
import 'package:reataurant/fastenDelivery/orderFive.dart';
import 'package:reataurant/fastenDelivery/orderFour.dart';
import 'package:reataurant/fastenDelivery/orderOne.dart';
import 'package:reataurant/fastenDelivery/orderSix.dart';
import 'package:reataurant/fastenDelivery/orderThree.dart';
import 'package:reataurant/fastenDelivery/orderTwo.dart';
import 'package:reataurant/kinds/burger.dart';
import 'package:reataurant/kinds/fish.dart';
import 'package:reataurant/kinds/pasta.dart';
import 'package:reataurant/kinds/pizza.dart';
import 'package:reataurant/kinds/salad.dart';
import 'package:reataurant/offers/offersList.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List drinks = [
    {
      "pic" : "lib/img/black1.png",
      "txt1" : "Admiral and Cola",
      "price" : "150E.g"
    },
    {
      "pic" : "lib/img/black2.png",
      "txt1" : "Black Russian",
      "price" : "210E.g"
    },
    {
      "pic" : "lib/img/black3.png",
      "txt1" : "Espresso Martini",
      "price" : "250E.g"
    },
    {
      "pic" : "lib/img/black4.png",
      "txt1" : "Black Margarita",
      "price" : "240E.g"
    },
    {
      "pic" : "lib/img/black5.png",
      "txt1" : "Black Almond",
      "price" : "320E.g"
    },
    {
      "pic" : "lib/img/black6.png",
      "txt1" : "Black Cocktail",
      "price" : "370E.g"
    },
  ];
  int myInt = 0;
  List<Widget> get myBody => [
    // Home
    Container(
        width:double.infinity,
        color:Color(0xff2A3439),
        child:ListView(
          children:[
            Row(
              children:[
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(top:15,left:10),
                        child: Text(
                            "Welcome to our",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:5),
                        child: Text(
                            "Hope restaurant",
                            style:TextStyle(
                                fontSize:20,
                                fontWeight:FontWeight.w300,
                                color:Colors.white
                            )
                        ),
                      ),
                    ]
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top:12,left:180),
                    child: CircleAvatar(
                      backgroundColor:Colors.white12,
                      child:PopupMenuButton(
                        color:Color(0xffFF7F50),
                        itemBuilder:(context){
                          return [
                            PopupMenuItem(
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children:[
                                  Text(
                                    "Setting",
                                    style:TextStyle(
                                      fontSize:22,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                  ),
                                  Icon(
                                    Icons.settings,
                                    color:Colors.white,
                                    size:22
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children:[
                                  Text(
                                      "call us",
                                      style:TextStyle(
                                        fontSize:22,
                                        fontWeight:FontWeight.w500,
                                        color:Colors.white,
                                      )
                                  ),
                                  Icon(
                                      Icons.phone,
                                      color:Colors.white,
                                      size:22
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap:()async{
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                                  return Login();
                                }), (route) => false);
                              },
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children:[
                                  Text(
                                      "Sign out",
                                      style:TextStyle(
                                        fontSize:22,
                                        fontWeight:FontWeight.w500,
                                        color:Colors.white,
                                      )
                                  ),
                                  Icon(
                                      Icons.exit_to_app_outlined,
                                      color:Colors.white,
                                      size:22
                                  )
                                ],
                              ),
                            ),
                          ];
                        },
                      )
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:50,left:10),
              child: Text(
                  "What would you like",
                  style:TextStyle(
                      fontSize:30,
                      fontWeight:FontWeight.w500,
                      color:Colors.white
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5,left:10),
              child: Text(
                  "to order?",
                  style:TextStyle(
                      fontSize:30,
                      fontWeight:FontWeight.w500,
                      color:Colors.white
                  )
              ),
            ),
            Row(
              children:[
                Expanded(child:Padding(
                  padding: const EdgeInsets.only(left:10,top:20),
                  child: TextFormField(
                    style:TextStyle(
                      fontSize:22,
                      fontWeight:FontWeight.w500,
                      color:Colors.white54,
                    ),
                    cursorColor:Colors.white,
                    decoration:InputDecoration(
                        filled:true,
                        fillColor:Colors.black12,
                        prefixIcon:Icon(
                          Icons.search,
                          color:Colors.white54,
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(
                                color:Colors.white24,
                                width:2
                            ),
                            borderRadius:BorderRadius.circular(15)
                        ),
                        enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(
                                color:Colors.white24,
                                width:2
                            ),
                            borderRadius:BorderRadius.circular(15)
                        ),
                        hintText:"Find for restaurant or food....",
                        hintStyle:TextStyle(
                            fontSize:25,
                            fontWeight:FontWeight.w400,
                            color:Colors.white54
                        )
                    ),
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.only(right:10,left:10,top:20),
                  child: Container(
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius:BorderRadius.circular(15)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                            Icons.sort,
                            color:Colors.white54,
                            size:50
                        ),
                      )
                  ),
                )
              ],
            ),
            SizedBox(
              height:15,
            ),
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child: Row(
                children:[
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return Pizza();
                      }));
                    },
                    child: Container(
                      height:200,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius:BorderRadius.circular(40),
                      ),
                      margin:EdgeInsets.all(10),
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: CircleAvatar(
                                backgroundImage:AssetImage("lib/img/pizza.jpg"),
                                radius:55,
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),
                            Text(
                                "pizza",
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return Burger();
                      }));
                    },
                    child: Container(
                      height:200,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius:BorderRadius.circular(40),
                      ),
                      margin:EdgeInsets.all(10),
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: CircleAvatar(
                                backgroundImage:AssetImage("lib/img/burger.jpg"),
                                radius:55,
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),
                            Text(
                                "burger",
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return Fish();
                      }));
                    },
                    child: Container(
                      height:200,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius:BorderRadius.circular(40),
                      ),
                      margin:EdgeInsets.all(10),
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: CircleAvatar(
                                backgroundImage:AssetImage("lib/img/fish.jpg"),
                                radius:55,
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),
                            Text(
                                "fish",
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return Pasta();
                      }));
                    },
                    child: Container(
                      height:200,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius:BorderRadius.circular(40),
                      ),
                      margin:EdgeInsets.all(10),
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: CircleAvatar(
                                backgroundImage:AssetImage("lib/img/pasta.jpg"),
                                radius:55,
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),
                            Text(
                                "pasta",
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return Salad();
                      }));
                    },
                    child: Container(
                      height:200,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius:BorderRadius.circular(40),
                      ),
                      margin:EdgeInsets.all(10),
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: CircleAvatar(
                                backgroundImage:AssetImage("lib/img/salad.jpg"),
                                radius:55,
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),
                            Text(
                                "salad",
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return Offer();
                }));
              },
              child:Padding(
                padding: const EdgeInsets.only(top:10,bottom:10,left:20,right:20),
                child: Container(
                  decoration:BoxDecoration(
                      color:Colors.black12,
                      borderRadius:BorderRadius.circular(20)
                  ),
                  height:120,
                  child:Row(
                      children:[
                        Column(
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(top:10),
                                child: Text(
                                  "Deals for Days",
                                  style:TextStyle(
                                    fontSize:25,
                                    fontWeight:FontWeight.w800,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10,left:10),
                                child: Text(
                                  "Get 0E.g delivery fee on",
                                  style:TextStyle(
                                    fontSize:18,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:5,left:10),
                                child: Text(
                                  "your first order over 100E.g!",
                                  style:TextStyle(
                                    fontSize:15,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ]
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left:28),
                            child: Image(
                                image:AssetImage("lib/img/off.png"),
                                width:145
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ),    //offers in your restaurant
            Padding(
              padding: const EdgeInsets.only(top:10,left:10),
              child: Text(
                  "Fastest delivery",
                  style:TextStyle(
                    fontSize:30,
                    fontWeight:FontWeight.w500,
                    color:Colors.white,
                  )
              ),
            ),
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child:Row(
                  children:[
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context){
                          return orderOne();
                        }));
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/piz.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Meat pizza",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.1 perfect (125)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Meat",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Chicken",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "paneer",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                        width:10
                    ),

                    InkWell(
                      onTap:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return orderTwo();
                        }), (route) => false);
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/bur.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Beef burger",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.8 perfect(130)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Meat",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Chicken",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "paneer",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                        width:10
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return orderThree();
                        }), (route) => false);
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/suushi.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Japen sushi",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.8 perfect(140)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "fish",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "lemon",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "salad",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                        width:10
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context){
                          return orderFour();
                        }));
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/fis.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Salmon fish",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.7 perfect (180)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "jawless",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "armoured",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "bony",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                        width:10
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return orderFive();
                        }), (route) => false);
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/pass2.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Orzo pasta",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.9 perfect(180)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Penne",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Radiatore",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Rotini",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                        width:10
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return orderSix();
                        }), (route) => false);
                      },
                      child:Container(
                          height:420,
                          margin:EdgeInsets.only(top:8,left:10),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.black12,
                          ),
                          width:370,
                          child:Column(
                            children:[
                              Image(
                                image:AssetImage("lib/img/salad2.jpg"),
                                height:250,
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:220,top:5,left:5),
                                child: Text(
                                    "Mixed salad",
                                    style:TextStyle(
                                      fontSize:25,
                                      fontWeight:FontWeight.w500,
                                      color:Colors.white,
                                    )
                                ),
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                children:[
                                  Icon(
                                      Icons.star,
                                      color:Colors.yellow,
                                      size:30
                                  ),
                                  SizedBox(
                                      width:5
                                  ),
                                  Text(
                                      "9.6 perfect(180)",
                                      style:TextStyle(
                                        fontSize:25,
                                        fontWeight:FontWeight.w400,
                                        color:Colors.white,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:8
                              ),
                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Bound",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Cobb",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color:Colors.black26,
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(right:20,left:20,top:5,bottom:5),
                                          child: Text(
                                              "Nicoise",
                                              style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                  ]
              ),
            )
          ],
        )
    ),

    // Drinks
    Container(
      width:double.infinity,
      color:Color(0xff2A3439),
      child:ListView(
        children:[
          Padding(
            padding: const EdgeInsets.only(top:45,left:10),
            child: Text(
              "What would you like?",
              style:Theme.of(context).textTheme.headline2
            ),
          ),
          SizedBox(
            height:25
          ),
          Padding(
            padding: const EdgeInsets.only(right:8,left:8),
            child: TextFormField(
              style:TextStyle(
                fontSize:22,
                fontWeight:FontWeight.w500,
                color:Colors.white54,
              ),
              cursorColor:Colors.white,
              decoration:InputDecoration(
                  filled:true,
                  fillColor:Colors.black12,
                  prefixIcon:Icon(
                    Icons.search,
                    color:Colors.white54,
                  ),
                  focusedBorder:OutlineInputBorder(
                      borderSide:BorderSide(
                          color:Colors.white24,
                          width:2
                      ),
                      borderRadius:BorderRadius.circular(15)
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(
                          color:Colors.white24,
                          width:2
                      ),
                      borderRadius:BorderRadius.circular(15)
                  ),
                  hintText:"Search",
                  hintStyle:TextStyle(
                      fontSize:25,
                      fontWeight:FontWeight.w400,
                      color:Colors.white54
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10,left:10,top:10),
            child: Container(
              height:160,
              decoration:BoxDecoration(
                 color:Colors.black12,
                 borderRadius:BorderRadius.circular(25)
              ),
              child:Row(
                children:[
                  Column(
                    children:[
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top:10,left:10),
                          child: Text(
                              "Hot Coffee Collection",
                              style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w400,
                                  color:Colors.deepOrangeAccent
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                          height:15
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: Text(
                              "Have a cool meal with drink",
                              style:TextStyle(
                                  fontSize:20,
                                  fontWeight:FontWeight.w500,
                                  color:Colors.white
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                          height:15
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:80),
                        child: Row(
                          children:[
                            Text(
                                "150E.G",
                                style:TextStyle(
                                    fontSize:22,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.deepOrangeAccent
                                )
                            ),
                            SizedBox(
                                width:5
                            ),
                            Text(
                                "/",
                                style:TextStyle(
                                    fontSize:25,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.white
                                )
                            ),
                            SizedBox(
                                width:5
                            ),
                            Text(
                                "0.5gm",
                                style:TextStyle(
                                    fontSize:22,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.blueGrey
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Image(
                      width:135,
                      image:AssetImage("lib/img/costa1.png")
                    ),
                  ),
                ]
              ),
            ),
          ),
          SizedBox(
            height:25
          ),
          SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child:Row(
              children:[
                InkWell(
                 onTap:(){},
                 child: Padding(
                   padding: const EdgeInsets.only(left:10),
                   child: Container(
                     decoration:BoxDecoration(
                         color:Colors.black12,
                         borderRadius:BorderRadius.circular(10)
                     ),
                     child:Padding(
                       padding: const EdgeInsets.all(12),
                       child: Text(
                           "Black",
                         style:TextStyle(
                           fontSize:25,
                           fontWeight:FontWeight.w500,
                           color:Colors.white
                         )
                       ),
                     )
                   ),
                 ),
               ),
                SizedBox(
                  width:25
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            "White",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                        ),
                      )
                  ),
                ),
                SizedBox(
                    width:25
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            "Cold",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                        ),
                      )
                  ),
                ),
                SizedBox(
                    width:25
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            "Hot",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                        ),
                      )
                  ),
                ),
                SizedBox(
                    width:25
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            "Spark",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.w500,
                                color:Colors.white
                            )
                        ),
                      )
                  ),
                ),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,right:5,left:5),
            child: GridView.builder(
                physics:NeverScrollableScrollPhysics(),
                shrinkWrap:true,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing:5,
                  mainAxisSpacing:5,
                ),
                itemCount:drinks.length,
                itemBuilder:(context,i){
                  return InkWell(
                      onTap:(){},
                      child:Card(
                        shape:OutlineInputBorder(
                            borderRadius:BorderRadius.circular(15),
                            borderSide:BorderSide(
                                color:Colors.black12
                            )
                        ),
                        color:Colors.black26,
                        child:Column(
                            children:[
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child:Image(
                                      height:150,
                                      width:130,
                                      fit:BoxFit.cover,
                                      image:AssetImage("${drinks[i]["pic"]}")
                                  ),
                                  height:130,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  "${drinks[i]["txt1"]}",
                                  style:TextStyle(
                                    fontSize:22,
                                    fontWeight:FontWeight.w800,
                                    color:Colors.blueGrey,
                                  ),
                                ),
                              ),
                              Row(
                                  children:[
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:5,left:5),
                                        child: Text(
                                            "${drinks[i]["price"]}",
                                            style:TextStyle(
                                                fontSize:22,
                                                color:Colors.deepOrangeAccent,
                                                fontWeight:FontWeight.w600
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:75,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: InkWell(
                                        onTap:(){},
                                        child: CircleAvatar(
                                          child:Icon(
                                              Icons.add
                                          ),
                                          backgroundColor:Color(0xff645394),
                                          radius:15,
                                        ),
                                        splashColor:Colors.black26,
                                        focusColor:Colors.black26,
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                        ),
                      )
                  );
                }
            ),
          ),
        ],
      ),
    ),

    // Orders
    Container(
      width:double.infinity,
      color:Colors.yellow,
    ),

    // Account
    Container(
      width:double.infinity,
      color:Color(0xff2A3439),
      child:ListView(
        children:[
          SizedBox(
            height:30
          ),
          Center(
            child:CircleAvatar(
              backgroundImage:AssetImage("lib/img/ahmed.jpg"),
              radius:60,
            )
          ),
          SizedBox(
              height:15
          ),
          Center(
            child: Text(
                "Ahmed Khalaf",
                style:TextStyle(
                    fontSize:24,
                    fontWeight:FontWeight.w500,
                    color:Colors.white
                )
            ),
          ),
          SizedBox(
              height:15
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              leading:Container(
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(25),
                  color:Colors.black26,
                ),
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.dark_mode_rounded,
                    size:30,
                    color:Colors.white54
                  ),
                )
              ),
              title:Text(
                "Dark mode",
                style:TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.w400,
                  color:Colors.white
                )
              ),
              trailing:Text(
                  "System",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w900,
                      color:Colors.black26
                  )
              ),
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              leading:Container(
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(25),
                    color:Colors.black26,
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                        Icons.airplanemode_active,
                        size:30,
                        color:Colors.green
                    ),
                  )
              ),
              title:Text(
                  "Active status",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color:Colors.white
                  )
              ),
              trailing:Text(
                  "On",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w900,
                      color:Colors.black26
                  )
              ),
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              leading:Container(
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(25),
                    color:Colors.black26,
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                        Icons.accessibility,
                        size:30,
                        color:Colors.white54
                    ),
                  )
              ),
              title:Text(
                  "Accessibility",
                  style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w400,
                      color:Colors.white
                  )
              ),
              trailing:Icon(
                Icons.arrow_forward_ios_outlined,
                color:Colors.black26
              )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(25),
                      color:Colors.blueAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.safety_check,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Privacy & safety",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.blueAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.supervisor_account,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Supervision",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.purpleAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.face,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Avatar",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.purpleAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.notifications,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Notifications & sounds",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.purpleAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.swap_calls,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Switch account",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.deepOrangeAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.warning,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Report a problem",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
          SizedBox(
              height:10
          ),
          InkWell(
            onTap:(){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                return Login();
              }), (route) => false);
            },
            child: ListTile(
                leading:Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        color:Colors.deepOrangeAccent
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                          Icons.exit_to_app_outlined,
                          size:30,
                          color:Colors.white
                      ),
                    )
                ),
                title:Text(
                    "Log out",
                    style:TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w400,
                        color:Colors.white
                    )
                ),
                trailing:Icon(
                    Icons.arrow_forward_ios_outlined,
                    color:Colors.black26
                )
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        showUnselectedLabels:true,
        currentIndex:myInt,
        onTap:(val){
          setState(() {
            myInt = val;
          });
        },
        selectedLabelStyle:TextStyle(
          fontSize:15,
          fontWeight:FontWeight.w500,
        ),
        selectedItemColor:Color(0xff2A3439),
        unselectedItemColor:Color(0xffFF7F50),
        items:[
          BottomNavigationBarItem(
            label:"Home",
            icon:Icon(
              Icons.home
            ),
          ),
          BottomNavigationBarItem(
            label:"Drinks",
            icon:Icon(
                Icons.shopping_cart_rounded
            ),
          ),
          BottomNavigationBarItem(
            label:"Orders",
            icon:Icon(
                Icons.list_alt_outlined
            ),
          ),
          BottomNavigationBarItem(
            label:"Account",
            icon:Icon(
                Icons.person
            ),
          ),
        ],
      ),
      body:myBody.elementAt(myInt),
    );
  }
}

