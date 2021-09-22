import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:my_project/flexible.dart';
class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({ Key? key }) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'images/';

  final CarouselController _controller = CarouselController();

  //List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _character = 0;

  final List<String> images=[
    'images/141285980_2871439943175944_5339100608751989090_n.jpg',
    'images/174206819_314888083314519_5707056513242340894_n.jpg',
    'images/20210407032243_1.jpg',
    'images/the-flash-season-3-duet-image-5.jpg',
    'images/wp8158628.jpg'
  ]; 

  final List<String> names=['Doremon','Barry','LaraCroft','KaraBarry','ArrowFlashSupergirl'];
  List<Widget> loopImageTiles(Size screen){
    return images.map((element) =>ClipRRect(
        child: Image.asset(element,
        fit:BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.0),

    ) ).toList();
  }
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var imageSliders=loopImageTiles(screen);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children:[
          CarouselSlider(items: imageSliders, options: CarouselOptions(
            enlargeCenterPage: true, 
            autoPlay: true, 
            aspectRatio: 16/6,
            onPageChanged: (index,other){
              setState(() {
                _character = index;
                for(int i=0; i<imageSliders.length;i++){
                  if(i==index){
                      _isSelected[i]=true;
                  }
                  else{
                    _isSelected[i]=false;
                  }
                }
              });
            }
          ),
          carouselController: _controller,
          ),
          AspectRatio(aspectRatio: 16/6,
                    child:Center(
                    child: Text(names[_character],
                      style: TextStyle(
                        letterSpacing: 8,
                        decoration: TextDecoration.none,
                        //fontFamily: 'Electrolize',
                        color: Colors.red,
                        fontSize: screen.width / 50,

                      ),),  
          )
          ),
          ResponsiveWidget.isSmallScreen(context)?
           AspectRatio(aspectRatio: 14/8,
          child: Center(
            child:Align(
              alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: screen.width/8,
                right: screen.width/8,
              ),
              
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom:0
                    ),
                    child:Row 
                    (
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[
                        for(int data=0; data<names.length; data++)

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                           Padding(
                             padding: EdgeInsets.only(
                               top: screen.height/80,
                               bottom: screen.height/90
                             ),
                             child: Text(names[data]),
                           ),
                        Visibility(
                          visible: _isSelected[data],
                          child:Container(
                            height: 5,
                            width: screen.width/40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:Colors.orangeAccent
                             ),
                           )
                           )
                          ],
                        ),
                      ]
                    )
                    ),
                  ),
                ),
              ),
            ),
            ):
          AspectRatio(aspectRatio: 15/7,
          child: Center(
            child:Align(
              alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: screen.width/8,
                right: screen.width/8,
              ),
              
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screen.height/50,
                      bottom: screen.height/50,
                    ),
                    child:Row 
                    (
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[
                        for(int data=0; data<names.length; data++)

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                           Padding(
                             padding: EdgeInsets.only(
                               top: screen.height/80,
                               bottom: screen.height/90
                             ),
                             child: Text(names[data]),
                           ),
                        Visibility(
                          visible: _isSelected[data],
                          child:Container(
                            height: 5,
                            width: screen.width/40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:Colors.orangeAccent
                             ),
                           )
                           )
                          ],
                        ),
                      ]
                    )
                    ),
                  ),
                ),
              ),
            ),
            )
          
          
      ],
      )
    );
  }
}