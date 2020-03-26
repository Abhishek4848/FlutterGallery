
import 'package:alpha/sign_in.dart';
import 'package:flutter/material.dart';
import './Home.dart';
import './Screen1.dart';
import './Profile.dart';
import './sign_in.dart';
import './User_info.dart';

class Alpha extends StatefulWidget {
  @override
  State <StatefulWidget> createState(){
    return AlphaState();
  }
}

class AlphaState extends State<Alpha>{

  int _currentIndex=0;

  final tabs = [
    Images(),
    Gallery(),
    MyApp()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Alpha'),
        actions: <Widget>[
            IconButton(
              splashColor: Colors.lightGreenAccent,
              icon:CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl,)
              ) ,
             onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserInfo(),
                  )
                ), 
            ),       
        ],
      ),
      backgroundColor:Colors.black,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex:_currentIndex,
      selectedFontSize: 15.0,
      unselectedFontSize: 10.0,
      backgroundColor: Colors.black,
        items: [
         BottomNavigationBarItem(
            icon: Icon(Icons.image, color: Colors.red,),
            title: Text('Carousel',style:TextStyle(color: Colors.red),),
            backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.landscape,color: Colors.lightGreenAccent),
            title: Text('Gallery',style:TextStyle(color:Colors.lightGreenAccent),),
            backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.lightBlue),
            title: Text('About',style:TextStyle(color:Colors.lightBlue)),
            backgroundColor: Colors.greenAccent,
            ),
          ],
        onTap:(index){
          setState(() {
           _currentIndex=index;
          });
        }
      ),
      ),
    );
  }
}
