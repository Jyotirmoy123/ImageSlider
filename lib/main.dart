import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(MaterialApp( debugShowCheckedModeBanner:false,home: MySlider())); 
}

class MySlider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
 return Scaffold(
   body: Center(
   child:CarouselSlider(
     options: CarouselOptions(height: 400,autoPlay: true,enlargeCenterPage: true,),
     items: _imgURl.map((imagepath)
     {
      return Builder(builder:(BuildContext context){ 
      return Container(
      width:MediaQuery.of(context).size.width,
      margin:EdgeInsets.symmetric (horizontal: 5.0),
      child:Image.network(imagepath)

       ); 
       },
       );
       }
       ).toList(),),));
  }
  final List _source=[Colors.red,Colors.black,Colors.yellow];
  final _imgURl=['images/141285980_2871439943175944_5339100608751989090_n.jpg',
  'images/174206819_314888083314519_5707056513242340894_n.jpg',
  'images/20210407032243_1.jpg',
  'images/the-flash-season-3-duet-image-5.jpg',
  'images/wp8158628.jpg']; //give image path
}