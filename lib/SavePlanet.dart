import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BlueBall/SavePlanetData/WidgetData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'Widgets/EarthDataPage.dart';
import 'Widgets/SvaePlanetTile.dart';

class SaveTheWorld extends StatefulWidget{
  final VideoPlayerController controller;
  SaveTheWorld({@required this.controller});

  @override
  _SaveTheWorldState createState() => _SaveTheWorldState();
}

class _SaveTheWorldState extends State<SaveTheWorld> {
  bool showSecond = false;
  bool navigate = false;
  List<SavePlanetData> planetData =[];

  @override
  void initState() {
    loadWidgets(planetData);
    if(widget.controller != null){
      widget.controller..play()..setLooping(true);
    }
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showSecond = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(widget.controller),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Save The Planet',
                    style: GoogleFonts.quicksand(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 65.0),),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 10.0),
                      child: Container(
                        child: Text('No earth, no birth! If you want a happy life, save the earth. Earth is the only planet to have life, save the earth. Without earth, no one will take birth.',
                          style: GoogleFonts.quicksand(color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 22.0),),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0,left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Blue Ball',
                style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.0),),
            ),
          ),
          AnimatedCrossFade(
              firstChild:  Container(width: 0,height: 0,),
              secondChild: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.transparent,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0))
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Save the Planet',
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),),
                      ),
                      bottom: TabBar(
                        labelColor: Colors.black,
                        labelStyle: GoogleFonts.quicksand(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                        unselectedLabelStyle: GoogleFonts.quicksand(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400
                        ),
                        indicatorColor: Colors.transparent,
                        indicatorPadding: EdgeInsets.only(
                            bottom: 0.0),
                        tabs: [
                          Tab(text: 'To save the Planet',),
                          Tab(text: 'Our Earth',)],
                        indicatorWeight: 2.0,
                        indicatorSize: TabBarIndicatorSize.label,),
                    ),
                    body: Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: double.maxFinite,
                      child: TabBarView(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: planetData.length,
                                itemBuilder: (context,index){
                                  return SavePlanetTile(
                                    id: planetData[index].id,
                                    image: planetData[index].image,
                                    title: planetData[index].title,
                                    description: planetData[index].description,
                                    color1: planetData[index].color1,
                                    color2: planetData[index].color2,
                                    textColor: Colors.white70,
                                    size: planetData[index].size,
                                    padding: planetData[index].padding,
                                  );
                                }),
                            EarthData()
                          ]),
                    ),
                  ),
                ),
              ),
              crossFadeState: showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.bounceInOut,
              duration: Duration(seconds: 1))
        ],
      ),
    );
  }
}

loadWidgets(List<SavePlanetData> data){
  data.add(SavePlanetData(
      id:'1',
      title: 'Reuse and Recycle',
      description: 'Reuse is the action or practice of using an item, whether for its original purpose or to fulfil a different function. It should be distinguished from recycling, which is the breaking down of used items to make raw materials for the manufacture of new products. Reuse  by taking, but not reprocessing, previously used items – helps save time, money, energy and resources. In broader economic terms, it can make quality products available to people and organizations with limited means, while generating jobs and business activity that contribute to the economy',
      color1: Color(0xff77DD76),
      color2: Color(0xff5C8199),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/1.json',
      size: 260.0,
      padding: 0.0
  ));
  data.add(SavePlanetData(
      id:'2',
      title: 'Conserve water',
      description: 'Water conservation includes all the policies, strategies and activities to sustainably manage the natural resource of fresh water, to protect the hydrosphere, and to meet the current and future human demand.',
      color1: Color(0xff30EBD6).withOpacity(0.5),
      color2: Color(0xff30EBD6),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/2.json',
      size: 220.0,
      padding: 8.0
  ));
  data.add(SavePlanetData(
      id:'3',
      title: 'Conserve energy',
      description: 'Energy conservation is the effort made to reduce the consumption of energy by using less of an energy service. This can be achieved either by using energy more efficiently or by reducing the amount of service used. Energy conservation is a part of the concept of Eco-sufficiency.',
      color2: Color(0xff77DD76),
      color1: Color(0xff5C8199),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/3.json',
      size: 220.0,
      padding: 30.0
  ));
  data.add(SavePlanetData(
      id:'4',
      title: 'Avoid Toxic Chemicals',
      description: 'Toxic gases can be present in a confined space because the type of manufacturing process uses toxic substances as part of the production process, or biological and chemical "breakdown" of the product being stored in a tank, and from maintenance activities (welding) being performed in the confined space.',
      color1: Color(0xffF89631).withOpacity(0.5),
      color2: Color(0xffF27935),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/4.json',
      size: 220.0,
      padding: 20.0
  ));
  data.add(SavePlanetData(
      id:'5',
      title: 'Plant trees',
      description: 'Trees contribute to their environment by providing oxygen, improving air quality, climate amelioration, conserving water, preserving soil, and supporting wildlife.',
      color2: Color(0xff99C846),
      color1: Color(0xff717D7E),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/5.json',
      size: 220.0,
      padding: 25.0
  ));
  data.add(SavePlanetData(
      id:'6',
      title: 'Give up plastics',
      description: 'Plastics can take hundreds or even thousands of years for plastic to break down so the environmental damage is long-lasting. It affects all organisms in the food chain from tiny species like plankton through to whales.',
      color2: Color(0xffF4350F),
      color1: Color(0xffFBC2B5),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/6.json',
      size: 220.0,
      padding: 0.0
  ));
  data.add(SavePlanetData(
      id:'7',
      title: 'Education',
      description: 'Environmental education is a process that allows individuals to explore environmental issues, engage in problem solving, and take action to improve the environment. As a result, individuals develop a deeper understanding of environmental issues and have the skills to make informed and responsible decisions.',
      color2: Color(0xffDBA523),
      color1: Color(0xff5DAACC),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/7.json',
      size: 170.0,
      padding: 50.0
  ));
  data.add(SavePlanetData(
      id:'8',
      title: 'Agriculture',
      description: 'Agriculture is the science and art of cultivating plants and livestock. Agriculture was the key development in the rise of sedentary human civilization, whereby farming of domesticated species created food surpluses that enabled people to live in cities. The history of agriculture began thousands of years ago.',
      color1: Color(0xffEAC583),
      color2: Color(0xff83D715),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/8.json',
      size: 220.0,
      padding: 25.0
  ));
  data.add(SavePlanetData(
      id:'9',
      title: 'Alternative fuels',
      description: 'Pollution caused by exhaust gases emitted by fossil fuel engines thereby causing global warming has necessitated the need for alternate fuel.',
      color1: Color(0xff77DD76),
      color2: Color(0xff5C8199),
      textColor: Colors.black,
      image:'assets/SaveWorldAssets/9.json',
      size: 220.0,
      padding: 0.0
  ));
}


