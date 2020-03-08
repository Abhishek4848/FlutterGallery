import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

_callNumber() async{
  const number = '9986946270'; 
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
}
_launchEmail() async {
  String email = 'v.abhishek1347@gmail.com';
  if (await canLaunch("mailto:$email")) {
    await launch("mailto:$email");
  } else {
    throw 'Could not launch';
  }
}

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Colors.black,

        body:SafeArea (
          child:Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
             [
              CircleAvatar(
                radius:50.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('images/pro.jpg'),
              ),
            
            Text(
              "Abhishek V",
              style:TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color:Colors.white, 
                fontFamily: 'ShadowsIntoLight'),
                ),
            Text(
              "Flutter Developer",
              style:TextStyle(
                fontFamily: 'ShadowsIntoLight',
                color:Colors.white,
                fontSize:20.0,
                letterSpacing: 2.5),
                ),
          SizedBox(
            width:double.infinity,
            height: 10.0,
            ),
          SizedBox(
            height:20.0,
            width:150.0 ,
            child: Divider(color: Colors.white,),
            ),
            InkWell(
              onTap: (){_launchEmail();},
          child: Card (
            margin:EdgeInsets.symmetric(vertical:10.0,horizontal:25.0),
            color:Colors.white,
	          child:Padding(padding:EdgeInsets.all(15.0),
            child:Row(children:<Widget>[Icon(Icons.email,color:Colors.teal,),Text('v.abhishek1347@gmail.com')],
             ),
            ),
          ),
            ),
            InkWell(
              onTap: (){_callNumber();},
            child:Card (
            margin:EdgeInsets.symmetric(vertical:10.0,horizontal:25.0),
            color:Colors.white,
	          child:Padding(padding:EdgeInsets.all(15.0),
            child:Row(children:<Widget>[Icon(Icons.phone_android,color:Colors.teal,),Text('9986946270')],
             ),
            ),
          ),
            ),
             ]
             ),
          ),
      ),
      
    );
  }
}