import 'package:alpha/Login_page.dart';
import './Navigation.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import './sign_in.dart';


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
 final FirebaseMessaging messaging=FirebaseMessaging();

@override
  void initState() {
  messaging.configure(
    onLaunch: (Map<String, dynamic>msg){
      print("onLaunch called");
    },
    onResume: (Map<String, dynamic>msg){
      print("onResume called");
    },
    onMessage: (Map<String, dynamic>msg){
      print("onMessage called");
    },    
  );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    ]);
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds:Gsignin(),
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
class Gsignin extends StatefulWidget {
  @override
  _GsigninState createState() => _GsigninState();
}

class _GsigninState extends State<Gsignin> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          (uid != null && authSignedIn != false) ? Alpha() : LoginPage(),
    );
  }
}
