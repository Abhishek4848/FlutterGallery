
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './Home.dart';
import './Screen1.dart';
import './Profile.dart';
void main(){
  runApp(new MaterialApp(
    home: new Splash(),
  ));
}
class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Alpha(),
      image: Image.asset('images/gallery.png',alignment: Alignment.center,),
      title:Text('AlphaGallery',
      style:TextStyle( color: Colors.lightGreenAccent,
        fontFamily: 'ShadowsIntoLight',
        fontSize: 25.0,
      ),),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      loaderColor: Colors.red,
      loadingText:const Text('Loading...'),
      styleTextUnderTheLoader:new TextStyle(),
    );
  }
}

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
      home: Scaffold(
      appBar:AppBar(
        title:Text('Alpha'),
        backgroundColor: Colors.blueGrey,
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
