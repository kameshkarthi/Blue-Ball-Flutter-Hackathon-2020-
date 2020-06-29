import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ExpansionScreen extends StatefulWidget{
  final String title;
  final String description;
  final String image;
  final Color color1;
  final Color color2;
  final String tag;
  ExpansionScreen({
    this.title,
    this.description,
    this.color1,
    this.color2,
    this.image,
    this.tag
  });
  @override
  _ExpansionScreenState createState() => _ExpansionScreenState();
}

class _ExpansionScreenState extends State<ExpansionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: widget.tag,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [widget.color2, widget.color1],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Lottie.asset(widget.image,
                  fit: BoxFit.cover,
                  width: 250.0,
                  height: 250.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListTile(
              title: Text(widget.title,
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  fontSize: 20.0
                ),),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
          Positioned(
            top: 300.0,
            child: Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.title,
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Text(widget.description,
                    style: GoogleFonts.quicksand(
                      fontSize: 25.0,
                      color: Colors.white
                    ),),
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}