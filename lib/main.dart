import 'package:flutter/material.dart';
import 'package:BlueBall/SavePlanet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'Pandemic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blue Ball',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
 int currentIndex = 0;


 VideoPlayerController saveWorldController = VideoPlayerController.asset('assets/Videos/SaveTheWorld.mp4');
 VideoPlayerController pandemicController = VideoPlayerController.asset('assets/Videos/HandWash.mp4');


  
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  
  @override
  void initState() {
    pandemicController..initialize().then((value) {
      print('HandWash video');
    });
    saveWorldController..initialize().then((value) {
      print('Save The World Video');
    });
    super.initState();
  }

  List<Widget> screens(){
    return [
      SaveTheWorld(controller: saveWorldController),
      PandemicScreen(controller: pandemicController)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screens()[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)
              ),
              child: Container(
                color: Colors.white.withOpacity(0.5),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text('Save The Planet 🌎',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              color: currentIndex == 0 ? Colors.black : Colors.black.withOpacity(0.5),
                              fontSize: currentIndex == 0 ? 16.0 : 12.0
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text('Pandemic',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == 1 ? Colors.black : Colors.black.withOpacity(0.5),
                                  fontSize: currentIndex == 1 ? 16.0 : 12.0
                              ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ), // new
    );
  }
}
