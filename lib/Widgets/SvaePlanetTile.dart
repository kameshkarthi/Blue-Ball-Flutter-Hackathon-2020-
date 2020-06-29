import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'ExpansionScreen.dart';
class SavePlanetTile extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String image;
  final Color color1;
  final Color color2;
  final Color textColor;
  final double padding;
  final double size;
  SavePlanetTile({this.title,this.description,this.image,this.color1,this.color2,this.textColor,this.id,this.padding,this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ExpansionScreen(
            title: title,
            description: description,
            color2: color2,
            color1: color1,
            image: image,
            tag: id,
          );
        }));
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: BoxShadowPainter(),
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Hero(
                  tag: id,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8 * 1.33,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color1, color2],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0,right: 5.0,bottom: padding),
              child: Hero(
                tag: 'Tag $id',
                child: Lottie.asset(image,
                fit: BoxFit.cover,
                height: size,
                width: size),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.quicksand(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0,top: 20.0),
                  child: ButtonTheme(
                    minWidth: 150.0,
                    height: 40.0,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        disabledColor: Colors.grey,
                        textColor: Colors.white,
                        color: color2,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ExpansionScreen(
                              title: title,
                              description: description,
                              color2: color2,
                              color1: color1,
                              image: image,
                              tag: id,
                            );
                          }));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('More'),
                            Icon(Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
    path.close();

    canvas.drawShadow(path, Colors.black, 3.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}