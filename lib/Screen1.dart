import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot>wallpapersList;

  final CollectionReference collectionReference = Firestore.instance.collection("Wallpapers");

@override
  void initState() {
    super.initState();
    subscription= collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        wallpapersList=datasnapshot.documents;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    backgroundColor: Colors.black,
    body: wallpapersList != null?
    StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      itemCount: wallpapersList.length,
      itemBuilder: (context,i){
         String imgPath=wallpapersList[i].data['url'];
         return Material(
           elevation: 8.0,
           borderRadius: BorderRadius.all(Radius.circular(8.0)),
           child: InkWell(
             child: Hero(
               tag: imgPath,
               child: FadeInImage(
                 image: NetworkImage(imgPath),
                 fit: BoxFit.cover,
                 placeholder: AssetImage('images/gallery.png'),
                 ),
             ),
           ),
         );
      },
      staggeredTileBuilder:(i) => StaggeredTile.count(2,i.isEven?2:3),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    ): Center (child: CircularProgressIndicator(),)
    );
  }
}