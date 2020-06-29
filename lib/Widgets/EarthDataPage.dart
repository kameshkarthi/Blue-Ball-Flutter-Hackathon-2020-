import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:BlueBall/AnimatedList/ListEffect.dart';
import 'package:BlueBall/SavePlanetData/EarthData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EarthData extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EarthData> {
  List<EarthDataModel> earthData = [
    EarthDataModel(
      text : 'Distance from Sun',
      data: '149.6 million km'
    ),
    EarthDataModel(
        text : 'Age',
        data: '4.543 billion years'
    ),
    EarthDataModel(
        text : 'Radius',
        data: '6371 km'
    ),
    EarthDataModel(
        text : 'Mass',
        data: '5.972 x 10^24 kg'
    ),
    EarthDataModel(
        text : 'Water',
        data: '71%'
    ),
    EarthDataModel(
        text : 'Land',
        data: '29%'
    ),
    EarthDataModel(
        text : 'Desert',
        data: '33%'
    ),
    EarthDataModel(
        text : 'Forest Area',
        data: '4.06 billion hectares'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0,bottom: 30.0),
                child: Text('Earth',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0
                  ),),
              ),
              Lottie.asset('assets/Earth.json',
              fit: BoxFit.cover,
              height: 300.0,
              width: 300.0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago.',
            style: GoogleFonts.quicksand(
                color: Colors.black.withOpacity(0.7),
            fontSize: 18.0
            ),),
          ),
          Container(
              child: ListViewEffect(
                  duration: Duration(milliseconds: 200),
                  children: earthData.map((s) => tile(s.text, s.data)).toList())),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: mychart1Items('Population', '7.8 billion', ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: mychart2Items('Global Warming', '0.98C', ''),
            ),
          ),
          Container(
            height: 25.0,
          )
        ],
      ),
    );
  }
}

Widget tile(String text,String data){
  return Padding(
    padding: const EdgeInsets.only(left: 40.0,right: 40.0,top: 20.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.w400,
                fontSize: 20.0
            ),),
            Text(data,
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20.0
            ),)
          ],
        ),
      ),
  );
}

Material mychart1Items(String title, String priceVal,String subtitle) {
  var data = [585.0, 660.0, 710.0, 791.0, 978.0, 1262.0, 1650.0, 2521.0,6008.0,6707.0,6896.0,7052.0];
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Colors.black,
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(title, style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),),
                ),

                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(priceVal, style: GoogleFonts.quicksand(
                    fontSize: 30.0,
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                      child: Text('Population (in millions)',
                      style: GoogleFonts.quicksand(color: Colors.black),),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new Sparkline(
                        data: data,
                        lineColor: Color(0xffff6101),
                        pointsMode: PointsMode.all,
                        pointSize: 8.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text('Year (1500 - 2012)',
                  style: GoogleFonts.quicksand(
                    color: Colors.black
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material mychart2Items(String title, String priceVal,String subtitle) {
  var data1 = [0.17,-0.48,-0.29,-0.16,-0.2,0.07,-0.11,0.06,0.26,0.54,0.85];
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Colors.black,
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(title, style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),),
                ),

                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(priceVal, style: GoogleFonts.quicksand(
                    fontSize: 30.0,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(subtitle, style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    color: Colors.blueGrey,
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Temperature Anomaly (C)',
                          style: GoogleFonts.quicksand(color: Colors.black),),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: new Sparkline(
                        data: data1,
                        fillMode: FillMode.below,
                        fillGradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.redAccent],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text('Year (1880 - 2020)',
                    style: GoogleFonts.quicksand(
                        color: Colors.black
                    ),),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}