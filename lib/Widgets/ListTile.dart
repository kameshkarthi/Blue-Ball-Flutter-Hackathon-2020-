import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyTile extends StatefulWidget{
  final String title;
  final String description;
  final String image;
  final Color color;
  final Color textColor;
  final Color noFilColor;
  final Color yesFilColor;
  final Function noClick;
  final Function yesClick;

  MyTile({this.title,this.description,this.image,this.color,this.textColor,this.noClick,this.yesClick,this.noFilColor,this.yesFilColor});
  @override
  _MyTileState createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 60),
        width: MediaQuery.of(context).size.width,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         Flexible(
           child: Padding(
             padding: const EdgeInsets.only(top: 10.0,),
             child: Lottie.asset(
                 widget.image,
                 height: 250.0,
                 fit: BoxFit.cover),
           ),
         ),
         Align(
           alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(widget.title,style: GoogleFonts.quicksand(
                 color:  widget.textColor,
                 fontWeight: FontWeight.bold,
                 fontSize: 40.0
             ),),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(widget.description,style: GoogleFonts.quicksand(
               color: widget.textColor,
               fontWeight: FontWeight.w400,
               fontSize: 22.0
           ),),
         ),
         Padding(padding: EdgeInsets.only(top: 20.0,bottom: 5.0,right: 60.0),
         child: Text('Are you learned this ?',
           style: GoogleFonts.quicksand(
               color:  widget.textColor.withOpacity(0.8),
               fontWeight: FontWeight.bold,
               fontSize: 20.0
           ),),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:
                 ButtonTheme(
                   minWidth: 130.0,
                   child: FlatButton(
                     color: widget.noFilColor.withOpacity(0.7),
                     onPressed: (){
                       widget.noClick(true);
                     },
                     child: Text('No ?'
                     ),
                     textColor: Colors.black,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50)),
                   ),
                 )
             ),
             Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ButtonTheme(
                   minWidth: 130.0,
                   child: FlatButton(
                     color: widget.yesFilColor.withOpacity(0.7),
                     onPressed: (){
                       widget.yesClick(true);
                     },
                     child: Text('Yes',
                     ),
                     textColor: Colors.black,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50)),
                   ),
                 )
             ),
           ],
         ),
       ],
     ),
    );
  }
}