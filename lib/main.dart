import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login_page.dart';

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
      navigateAfterSeconds: Gsignin(),
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

class Gsignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}