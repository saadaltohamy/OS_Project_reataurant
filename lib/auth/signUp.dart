import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reataurant/auth/login.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool hiddenPass = false;
  void passwordhidden(){
    setState(() {
      hiddenPass = !hiddenPass;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body:Form(
         key:formState,
         child: ListView(
           children:[
             Padding(
               padding: const EdgeInsets.only(top:10),
               child: Image(
                   height:200,
                   image:AssetImage("lib/img/logoRest.png")
               ),
             ),
             SizedBox(
                 height:20
             ),
             Padding(
               padding: const EdgeInsets.only(left:15),
               child: Text(
                   "SignUp",
                   style:TextStyle(
                       fontSize:40,
                       fontWeight:FontWeight.w600,
                       color:Color(0xff242124)
                   )
               ),
             ),
             SizedBox(
                 height:10
             ),
             Padding(
               padding: const EdgeInsets.only(left:15),
               child: Text(
                   "Signup to your existing account",
                   style:TextStyle(
                       fontSize:20,
                       fontWeight:FontWeight.w400,
                       color:Color(0xff242124)
                   )
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:30,left:10),
               child: Text(
                 "UserName",
                 style:TextStyle(
                   fontSize:25,
                   fontWeight:FontWeight.w500,
                   color:Color(0xff242124),
                 ),
               ),
             ),
             SizedBox(
                 height:10
             ),
             Padding(
               padding: const EdgeInsets.only(right:15,left:15),
               child: TextFormField(
                 validator:(text){
                   if(text == ""){
                     return "you must enter username";
                   }
                 },
                 controller:user,
                 style:TextStyle(
                   fontSize:20,
                 ),
                 keyboardType:TextInputType.emailAddress,
                 cursorColor:Color(0xff242124),
                 decoration:InputDecoration(
                   suffixIcon:Icon(
                       Icons.person,
                       color:Color(0xff242124)
                   ),
                   focusedBorder:OutlineInputBorder(
                       borderSide:BorderSide(
                           color:Color(0xff242124)
                       )
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:30,left:10),
               child: Text(
                 "Email",
                 style:TextStyle(
                   fontSize:25,
                   fontWeight:FontWeight.w500,
                   color:Color(0xff242124),
                 ),
               ),
             ),
             SizedBox(
                 height:10
             ),
             Padding(
               padding: const EdgeInsets.only(right:15,left:15),
               child: TextFormField(
                 validator:(text){
                   if(text == ""){
                     return "you must enter email";
                   }
                 },
                 controller:email,
                 style:TextStyle(
                   fontSize:20,
                 ),
                 keyboardType:TextInputType.emailAddress,
                 cursorColor:Color(0xff242124),
                 decoration:InputDecoration(
                   suffixIcon:Icon(
                       Icons.email,
                       color:Color(0xff242124)
                   ),
                   focusedBorder:OutlineInputBorder(
                       borderSide:BorderSide(
                           color:Color(0xff242124)
                       )
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:30,left:10),
               child: Text(
                 "Password",
                 style:TextStyle(
                   fontSize:25,
                   fontWeight:FontWeight.w500,
                   color:Color(0xff242124),
                 ),
               ),
             ),
             SizedBox(
                 height:10
             ),
             Padding(
               padding: const EdgeInsets.only(right:15,left:15),
               child: TextFormField(
                 validator:(text){
                   if(text == ""){
                     return "you must enter password";
                   }
                 },
                 controller:pass,
                 style:TextStyle(
                   fontSize:20,
                 ),
                 obscureText:!hiddenPass,
                 keyboardType:TextInputType.text,
                 cursorColor:Color(0xff242124),
                 decoration:InputDecoration(
                     focusedBorder:OutlineInputBorder(
                         borderSide:BorderSide(
                             color:Color(0xff242124)
                         )
                     ),
                     suffixIcon:IconButton(
                         onPressed:passwordhidden,
                         icon:Icon(
                           color:Color(0xff242124),
                           !hiddenPass?Icons.visibility_off : Icons.visibility,
                         )
                     )
                 ),
               ),
             ),
             SizedBox(
                 height:10
             ),
             InkWell(
               onTap:(){},
               child: Padding(
                 padding: const EdgeInsets.only(top:5,left:240),
                 child: Text(
                   "Forget password?",
                   style:TextStyle(
                     fontSize:20,
                     fontWeight:FontWeight.w500,
                     color:Color(0xff242124),
                   ),
                 ),
               ),
             ),
             SizedBox(
                 height:20
             ),
             Padding(
               padding: const EdgeInsets.only(right:40,left:40),
               child: MaterialButton(
                 shape:OutlineInputBorder(
                     borderRadius:BorderRadius.circular(15)
                 ),
                 color:Color(0xff242124),
                 onPressed:()async{
                   if(formState.currentState!.validate()){
                     try {
                       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                         email:email.text,
                         password:pass.text,
                       );
                       FirebaseAuth.instance.currentUser!.sendEmailVerification();
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                         return Login();
                       }), (route) => false);
                     } on FirebaseAuthException catch (e) {
                       if (e.code == 'weak-password') {
                         print('The password provided is too weak.');
                         AwesomeDialog(
                           context: context,
                           dialogType: DialogType.info,
                           animType: AnimType.bottomSlide,
                           title: 'Warning',
                           desc: 'The password provided is too weak.',
                         )..show();
                       } else if (e.code == 'email-already-in-use') {
                         print('The account already exists for that email.');
                         AwesomeDialog(
                           context: context,
                           dialogType: DialogType.error,
                           animType: AnimType.bottomSlide,
                           title: 'Error',
                           desc: 'The account already exists for that email.',
                         )..show();
                       }
                     } catch (e) {
                       print(e);
                     }
                   }
                   else{
                     print("not Vaild");
                   }
                 },
                 child:Text(
                     "Register",
                     style:TextStyle(
                       color:Colors.white,
                       fontSize:25,
                       fontWeight:FontWeight.w400,
                     )
                 ),
               ),
             ),
             SizedBox(
                 height:5
             ),
             SizedBox(
                 height:10
             ),
             Padding(
               padding: const EdgeInsets.only(left:90),
               child: Row(
                 children:[
                   Text(
                     "Have any account?",
                     style:TextStyle(
                         fontSize:20,
                         fontWeight:FontWeight.w500,
                         color:Color(0xff242124)
                     ),
                   ),
                   SizedBox(
                       width:5
                   ),
                   InkWell(
                     onTap:(){
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                         return Login();
                       }), (route) => false);
                     },
                     child: Text(
                       "LogIn",
                       style:TextStyle(
                           fontSize:20,
                           fontWeight:FontWeight.w500,
                           color:Color(0xff242124)
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       )
   );
  }
}
