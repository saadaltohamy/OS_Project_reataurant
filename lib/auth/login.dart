import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reataurant/auth/signUp.dart';
import 'package:reataurant/pages/homePage.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool hiddenPass = false;
  bool loading = false;
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
       child:loading ? Center(child:CircularProgressIndicator(color:Color(0xff242124),)) :
       ListView(
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
                 "Login",
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
                 "Log in to your existing account",
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
                   return "you must enter your email";
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
                   return "you must enter the password";
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
             onTap:()async{
               if(email.text == ""){
                 AwesomeDialog(
                   context: context,
                   dialogType: DialogType.error,
                   animType: AnimType.bottomSlide,
                   title: 'Error',
                   desc: 'first,you must enter your email before do it',
                 )..show();
                 return;
               }
               try{
                 await FirebaseAuth.instance.sendPasswordResetEmail(email:email.text);
                 AwesomeDialog(
                   context: context,
                   dialogType: DialogType.success,
                   animType: AnimType.bottomSlide,
                   title: 'Note',
                   desc: 'please check your box to reset your password',
                 )..show();
               }catch(e){
                 AwesomeDialog(
                   context: context,
                   dialogType: DialogType.warning,
                   animType: AnimType.bottomSlide,
                   title: 'Note',
                   desc: 'This email doesnt exist here',
                 )..show();
               }
             },
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
                     loading = true;
                     setState((){});
                     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                         email:email.text,
                         password:pass.text,
                     );
                     loading = false;
                     setState((){});
                    if(FirebaseAuth.instance.currentUser!.emailVerified){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context){
                        return HomePage();
                      }), (route) => false);
                    }
                    else{
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.bottomSlide,
                        title: 'Warning',
                        desc: 'please check your box to verify your email.',
                      )..show();
                    }
                   } on FirebaseAuthException catch (e) {
                     if (e.code == 'user-not-found') {
                       print('No user found for that email.');
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.warning,
                         animType: AnimType.bottomSlide,
                         title: 'Warning',
                         desc: 'No user found for that email.',
                       )..show();
                     } else if (e.code == 'wrong-password') {
                       print('Wrong password provided for that user.');
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.error,
                         animType: AnimType.bottomSlide,
                         title: 'Error',
                         desc: 'Wrong password provided for that user.',
                       )..show();
                     }
                   }
                 }
                 else{
                   print("not Vaild");
                 }
               },
               child:Text(
                   "LogIn",
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
           Padding(
             padding: const EdgeInsets.only(left:60),
             child: Row(
               children:[
                 Text(
                   "Don't have any account?",
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
                       return SignUp();
                     }), (route) => false);
                   },
                   child: Text(
                     "Register",
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
