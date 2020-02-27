import 'package:flutter/material.dart';
//show BuildContext,Card;
//import 'package:flutter/src/material/icons.dart';

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
          Card (
            margin:EdgeInsets.symmetric(vertical:10.0,horizontal:25.0),
            color:Colors.white,
	          child:Padding(padding:EdgeInsets.all(15.0),
            child:Row(children:<Widget>[Icon(Icons.email,color:Colors.teal,),Text('v.abhishek1347@gmail.com')],
             ),
            ),
          ),
            Card (
            margin:EdgeInsets.symmetric(vertical:10.0,horizontal:25.0),
            color:Colors.white,
	          child:Padding(padding:EdgeInsets.all(15.0),
            child:Row(children:<Widget>[Icon(Icons.phone_android,color:Colors.teal,),Text('9986946270')],
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