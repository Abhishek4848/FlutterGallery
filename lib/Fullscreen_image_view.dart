  
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

  Future<void> setWallpaperFromFile() async {
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
  final LinearGradient backgroundGradient = LinearGradient(
      colors: [Colors.black,Colors.lightGreenAccent[200]],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

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
      floatingActionButton:
        FloatingActionButton.extended(
        onPressed:setWallpaperFromFile, 
        icon:Icon(Icons.wallpaper,),
        label: Text("Set Wallpaper"),
        foregroundColor: Colors.lightGreenAccent,
        splashColor: Colors.limeAccent,
        elevation: 25.0,
        backgroundColor: Colors.black,
        )
      
    );
  }
}