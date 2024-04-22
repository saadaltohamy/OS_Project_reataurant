import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reataurant/pages/homePage.dart';
class Pasta extends StatefulWidget {
  const Pasta({super.key});
  @override
  State<Pasta> createState() => _PastaState();
}
class _PastaState extends State<Pasta> {
  List items = [
    {
      "pic" :"lib/img/pasta1.png",
      "txt1" : "Scampioni",
      "txt2" : "shrimp,butter",
      "pri" : "280E.g"
    },
    {
      "pic" :"lib/img/pasta2.png",
      "txt1" : "Lasagne ",
      "txt2" : "meat,cheese",
      "pri" : "280E.g"
    },
    {
      "pic" :"lib/img/pasta3.png",
      "txt1" : "Agnolotti",
      "txt2" : "ricotta,sauce",
      "pri" : "280E.g"
    },
    {
      "pic" :"lib/img/pasta4.png",
      "txt1" : "Pecanesto",
      "txt2" : "basil,pecans",
      "pri" : "380E.g"
    },
    {
      "pic" :"lib/img/pasta5.png",
      "txt1" : "Lasagna",
      "txt2" : "seasoned,cheeses",
      "pri" : "420E.g"
    },
    {
      "pic" :"lib/img/pasta6.png",
      "txt1" : "Casserole",
      "txt2" : "sausage,sauce",
      "pri" : "450E.g"
    },
    {
      "pic" :"lib/img/pasta7.png",
      "txt1" : "Manicotti",
      "txt2" : "crepes,sauce",
      "pri" : "370E.g"
    },
    {
      "pic" :"lib/img/pasta8.png",
      "txt1" : "Gnocchi",
      "txt2" : "garlic,sauce",
      "pri" : "450E.g"
    },
    {
      "pic" :"lib/img/pasta9.png",
      "txt1" : "Baked",
      "txt2" : "provolone,sauce",
      "pri" : "480E.g"
    },
    {
      "pic" :"lib/img/pasta10.png",
      "txt1" : "Ravioli",
      "txt2" : "meat,cheese",
      "pri" : "510E.g"
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
                      "Pasta",
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
                          desc: 'order this pasta now,sir?',
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
                            // Image
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
