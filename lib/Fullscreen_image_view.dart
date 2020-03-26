  
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';


class FullScreenImagePage extends StatefulWidget {
  String imgPath;

  FullScreenImagePage(this.imgPath);
  

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  String _wallpaperFile = 'Unknown';
  String _lockFile='Unknown';
  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
  }

   Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await WallpaperManager.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> homeWallpaper() async {
    setState(() {
      _wallpaperFile = "Loading";
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperFile = result;
    });
  }
    Future<void> lockWallpaper() async {
    setState(() {
      _lockFile = "Loading";
    });
    String result1;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    try {
      result1 = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.LOCK_SCREEN);
    } on PlatformException {
      result1 = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _lockFile = result1;
    });
  }
  final LinearGradient backgroundGradient = LinearGradient(
      colors: [Colors.black54,Colors.lightGreenAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration:BoxDecoration(gradient: backgroundGradient),
          child: Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child:Hero(
                  tag: widget.imgPath,
                  child:Image.network(widget.imgPath),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: (){homeWallpaper();
                  showDialog(context:context,
                  builder: (BuildContext context){
                    return AlertDialog(title: Text("Alpha",style: TextStyle(color: Colors.green),),
                    content: Text("Applied HomeScreen wallpaper sucessfully !!!",style: TextStyle(color:Colors.lightGreenAccent),),
                    backgroundColor: Colors.black45,
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(30.0))) ,
                    actions: [
                      RaisedButton(onPressed:(){Navigator.of(context).pop();}, 
                      child: Text("OK",style: TextStyle(color:Colors.black),),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.all(Radius.circular(100.0))
                      ),
                      )
                    ],
                    );
                   }
                  );
                  },
                  icon: Icon(Icons.wallpaper),
                  label: Text("HomeScreen"),
                  foregroundColor: Colors.lightGreenAccent,
                  backgroundColor: Colors.black,
                  splashColor: Colors.limeAccent,
                  elevation: 25.0,                  
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  onPressed: (){lockWallpaper();
                  showDialog(context:context,
                  builder: (BuildContext context){
                    return AlertDialog(title: Text("Alpha",style: TextStyle(color:Colors.green),),
                    content: Text("Applied LockScreen wallpaper sucessfully !!!!",style: TextStyle(color:Colors.lightGreenAccent),),
                    backgroundColor: Colors.black45,
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(30.0))) ,                    
                    actions: [
                      RaisedButton(onPressed:(){Navigator.of(context).pop();}, 
                      child: Text("OK",style: TextStyle(color:Colors.black),),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.all(Radius.circular(100.0))
                      ),
                      )
                    ],
                    );
                   }
                  );
                  },
                  icon: Icon(Icons.wallpaper),
                  label: Text("LockScreen"),
                  foregroundColor: Colors.lightGreenAccent,
                  backgroundColor: Colors.black,
                  splashColor: Colors.limeAccent,
                  elevation: 25.0,                  
                ),
              ),              
            Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: new IconButton(
                        icon: new Icon(
                          Icons.close,
                          color: Colors.lightGreenAccent,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}