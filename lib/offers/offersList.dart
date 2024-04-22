import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reataurant/pages/homePage.dart';
class Offer extends StatefulWidget {
  const Offer({super.key});
  @override
  State<Offer> createState() => _OfferState();
}
class _OfferState extends State<Offer> {
  List items = [
    {
      "pic" : "lib/img/item1.jpeg",
      "txt1" : "Single burger with fries",
      "des" : "American burger",
      "pri1" : "180E.g",
      "pri2" : "250E.g"
    },
    {
      "pic" : "lib/img/item4.jpg",
      "txt1" : "Single pizza with cheese",
      "des" : "American pizza",
      "pri1" : "250E.g",
      "pri2" : "360E.g"
    },
    {
      "pic" : "lib/img/item13.jpg",
      "txt1" : "Single dish of pasta",
      "des" : "Egyptain pasta",
      "pri1" : "200E.g",
      "pri2" : "330E.g"
    },
    {
      "pic" : "lib/img/item12.jpg",
      "txt1" : "Salmon piece of fish",
      "des" : "American fish",
      "pri1" : "300E.g",
      "pri2" : "550E.g"
    },
    {
      "pic" : "lib/img/item6.jpg",
      "txt1" : "Single pizza with fries",
      "des" : "Italian pizza",
      "pri1" : "350E.g",
      "pri2" : "550E.g"
    },
    {
      "pic" : "lib/img/item10.jpg",
      "txt1" : "Herring fish with rice",
      "des" : "Italian fish",
      "pri1" : "650E.g",
      "pri2" : "850E.g"
    },
    {
      "pic" : "lib/img/item3.jpg",
      "txt1" : "Single burger with pepsi",
      "des" : "American burger",
      "pri1" : "230E.g",
      "pri2" : "350E.g"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation:0.0,
        backgroundColor:Color(0xff2A3439),
        title:Text(
            "Offers",
            style:Theme.of(context).textTheme.headline2
        ),
      ),
      body:Container(
        color:Color(0xff2A3439),
        child: Padding(
          padding: const EdgeInsets.only(top:15),
          child: ListView.builder(
            shrinkWrap:true,
            itemCount:items.length,
            itemBuilder:(context,i){
              return Column(
                children:[
                  InkWell(
                    onTap:(){
                       AwesomeDialog(
                         dialogBackgroundColor:Color(0xff2A3439),
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.bottomSlide,
                          desc: 'order this meal now,sir?',
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

                    child: Container(
                      height:130,
                      child: Card(
                        shape:OutlineInputBorder(
                          borderSide:BorderSide(
                              color:Colors.black12
                          ),
                          borderRadius:BorderRadius.circular(15),
                        ),
                        color:Colors.black12,
                        child:Row(
                          children:[
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Image(
                                    image:AssetImage("${items[i]["pic"]}"),
                                    height:100,
                                    width:110
                                ),
                              ),
                            ),
                            Column(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.only(top:15,left:20),
                                  child: Text(
                                      "${items[i]["txt1"]}",
                                      style:TextStyle(
                                          fontSize:22,
                                          fontWeight:FontWeight.w400,
                                          color:Colors.white
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:5,right:65),
                                  child: Text(
                                      "${items[i]["des"]}",
                                      style:TextStyle(
                                          fontSize:18,
                                          fontWeight:FontWeight.w300,
                                          color:Colors.white
                                      )
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children:[
                                      Padding(
                                        padding: const EdgeInsets.only(top:10,left:30,right:30),
                                        child: Text(
                                            "${items[i]["pri1"]}",
                                            style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w500,
                                                color:Color(0xffFF7F50),
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:12,right:20),
                                        child: Text(
                                            "${items[i]["pri2"]}",
                                            style:TextStyle(
                                                fontSize:25,
                                                fontWeight:FontWeight.w400,
                                                color:Color(0xffFF7F50),
                                                decoration:TextDecoration.lineThrough
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
