import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:wallpaperplugin/wallpaperplugin.dart';

  downUrl() async {
    StorageReference ref =FirebaseStorage.instance.ref().child("s1.jpeg");
    String durl = (await ref.getDownloadURL()).toString();
    return(Image.network(durl,fit: BoxFit.cover,));
}


 void main() => runApp(Gallery());

 class Gallery extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       body: GridView.count(
         crossAxisCount:2 ,
         children: <Widget>[
      InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s1.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
          print("tapped on container"); 
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s2.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s3.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s4.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s5.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s6.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s7.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s8.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
            InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s9.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s10.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s11.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s12.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s13.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s14.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s15.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s16.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s17.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s18.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s19.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),
        InkWell(                        
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Image(image:AssetImage('images/s20.jpeg'),fit: BoxFit.cover,),),                        
          onTap: () {                          
           print("tapped on container");
         },                      
      ),

      
     
   
    
  ],
)
      
     );
   }
 }