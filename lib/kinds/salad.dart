import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reataurant/pages/homePage.dart';
class Salad extends StatefulWidget {
  const Salad({super.key});
  @override
  State<Salad> createState() => _SaladState();
}
class _SaladState extends State<Salad> {
  List items = [
    {
      "pic" :"lib/img/salad1.png",
      "txt1" : "Caesar Salad",
      "txt2" : "kale,crisps",
      "pri" : "280E.g"
    },
    {
      "pic" :"lib/img/salad2.png",
      "txt1" : "Louie Salad",
      "txt2" : "Lump,crab",
      "pri" : "310E.g"
    },
    {
      "pic" :"lib/img/salad3.png",
      "txt1" : "cucumb Salad",
      "txt2" : "cucumber,crab",
      "pri" : "340E.g"
    },
    {
      "pic" :"lib/img/salad4.png",
      "txt1" : "Chopped Salad",
      "txt2" : "carrots,crab",
      "pri" : "370E.g"
    },
    {
      "pic" :"lib/img/salad5.png",
      "txt1" : "Vegit Salad",
      "txt2" : "carrots,tomato",
      "pri" : "320E.g"
    },
    {
      "pic" :"lib/img/salad6.png",
      "txt1" : "Fruit Salad",
      "txt2" : "pineapple,pom",
      "pri" : "210E.g"
    },
    {
      "pic" :"lib/img/salad7.png",
      "txt1" : "Mixfruit Salad",
      "txt2" : "Strawberry,grapes",
      "pri" : "350E.g"
    },
    {
      "pic" :"lib/img/salad8.png",
      "txt1" : "Tomatos Salad",
      "txt2" : "tomatos,saus",
      "pri" : "320E.g"
    },
    {
      "pic" :"lib/img/salad9.png",
      "txt1" : "Chrimp Salad",
      "txt2" : "chrimp,onion",
      "pri" : "340E.g"
    },
    {
      "pic" :"lib/img/salad10.png",
      "txt1" : "Tea-Leaf Salad",
      "txt2" : "peas,pepper",
      "pri" : "390E.g"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:Color(0xff2A3439),
        width:double.infinity,
        child: ListView(
          children:[
            Row(
              children:[
                Container(
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color:Colors.black12,
                  ),
                  margin:EdgeInsets.only(left:5),
                  child:IconButton(
                      onPressed:(){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                          return HomePage();
                        }), (route) => false);
                      },
                      icon:Icon(
                          Icons.arrow_back,
                          color:Colors.white,
                          size:25
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:115,top:20),
                  child: Text(
                      "Salad",
                      style:Theme.of(context).textTheme.headline1
                  ),
                ),
              ],
            ),
            Row(
              children:[
                Expanded(child:Padding(
                  padding: const EdgeInsets.only(left:10,top:20,right:20),
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
                        hintText:"Search food",
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
                          color:Color(0xffFF7F50),
                          borderRadius:BorderRadius.circular(15)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                            Icons.no_food,
                            color:Colors.white70,
                            size:40
                        ),
                      )
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:10,top:25),
              child: Text(
                  "Found",
                  style:Theme.of(context).textTheme.headline1
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10,),
              child: Text(
                  "10 results,sir!",
                  style:Theme.of(context).textTheme.headline1
              ),
            ),
            GridView.builder(
                physics:NeverScrollableScrollPhysics(),
                shrinkWrap:true,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing:10,
                  mainAxisSpacing:5,
                  mainAxisExtent:290,
                ),
                itemCount:items.length,
                itemBuilder:(context,i){
                  return InkWell(
                    onTap:(){
                      AwesomeDialog(
                          dialogBackgroundColor:Color(0xff2A3439),
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.bottomSlide,
                          desc: 'order this salad now,sir?',
                          descTextStyle:TextStyle(
                              fontSize:22,
                              fontWeight:FontWeight.w500,
                              color:Colors.white
                          ),
                          btnCancelColor:Colors.black12,
                          btnOkColor:Colors.black12,
                          btnCancelOnPress:(){},
                          btnOkOnPress:(){},
                          btnCancelText:"cancel",
                          btnOkText:"ok",
                          buttonsTextStyle:TextStyle(
                              fontSize:22,
                              fontWeight:FontWeight.w500,
                              color:Colors.white
                          )
                      )..show();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,left:5,right:5),
                      child: Card(
                        shape:OutlineInputBorder(
                            borderRadius:BorderRadius.circular(15),
                            borderSide:BorderSide(
                                color:Colors.black12
                            )
                        ),
                        color:Colors.black12,
                        child:Column(
                          children:[
                            // image
                            Container(
                              margin:EdgeInsets.only(left:10),
                              child: Padding(
                                padding: const EdgeInsets.only(right:18),
                                child: Padding(
                                  padding: const EdgeInsets.only(top:5),
                                  child: Image(
                                      image:AssetImage(items[i]["pic"]),
                                      height:130,
                                      fit:BoxFit.fill
                                  ),
                                ),
                              ),
                            ),

                            // Text1
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Text(
                                  items[i]["txt1"],
                                  style:TextStyle(
                                    fontSize:25,
                                    fontWeight:FontWeight.w600,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:3,
                            ),

                            // Text2
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Text(
                                  items[i]["txt2"],
                                  style:TextStyle(
                                    fontSize:20,
                                    fontWeight:FontWeight.w400,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:20,
                            ),

                            // Price
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text(
                                items[i]["pri"],
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.w500,
                                  color:Color(0xffFF7F50),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
