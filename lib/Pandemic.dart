import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Mecho/Projects/Flutter/flutter_hackethon_2020/lib/PandemicData/TileData.dart';
import 'file:///E:/Mecho/Projects/Flutter/flutter_hackethon_2020/lib/PandemicData/VerifyData.dart';
import 'package:BlueBall/Widgets/ListTile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import 'AnimatedList/ListEffect.dart';
import 'main.dart';

class PandemicScreen extends StatefulWidget{
  final VideoPlayerController controller;
  PandemicScreen({@required this.controller});

  @override
  _PandemicScreenState createState() => _PandemicScreenState();
}

class _PandemicScreenState extends State<PandemicScreen> {
  bool showSecond = false;

  @override
  void initState() {
    if(widget.controller != null){
      widget.controller..play()..setLooping(true);
    }
    Future.delayed(const Duration(milliseconds:500 ), () {
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
          AnimatedCrossFade(
              firstChild: Container(color: Colors.transparent,width: 0,height: 0,),
              secondChild: Container(
                width: MediaQuery.of(context).size.width,
                height: double.maxFinite,
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Pandemic',
                      style: GoogleFonts.quicksand(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 80.0),),
                    ),
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 10.0),
                          child: Container(
                            child: Text('To keep the body in good health is a duty... otherwise we shall not be able to keep our mind strong and clear.',
                            style: GoogleFonts.quicksand(color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 22.0),),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50.0,
                        right: 20.0
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: new OutlineButton(
                          borderSide: BorderSide(
                            color: Colors.teal
                          ),
                            child: new Text("What we have Learned?",
                            style: GoogleFonts.quicksand(
                              color: Colors.white
                            ),),
                            onPressed: (){
                              Navigator.of(context).push(createRoute(widget.controller));
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))
                        ),
                      ),
                    )
                  ],
                ),
              ),
              crossFadeState: showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.bounceInOut,
              duration: Duration(seconds: 2))
        ],
      ),
    );
  }
}

Route createRoute(VideoPlayerController videoPlayerController) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Scree1(controller:videoPlayerController,),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


class Scree1 extends StatefulWidget{
  final VideoPlayerController controller;
  Scree1({this.controller});
  @override
  _Scree1State createState() => _Scree1State();
}

class _Scree1State extends State<Scree1> with SingleTickerProviderStateMixin{
  List<String> yesData = [];
  List<String> noData = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<TileData> tiles = [];
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void initState() {
    if(widget.controller != null){
      widget.controller..play()..setLooping(true);
    }
    addItem(TileData(
      id: '1',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Hand Wash',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/1.json',
      description: 'Regular handwashing is one of the best ways to remove germs, avoid getting sick, and prevent the spread of germs to others. Whether are at home, at work, traveling, or out in the community, hand washing is important.',
    ),);
    addItem(TileData(
      id: '2',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Wear Face Mask',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/2.json',
      description: 'Wearing a face mask will help prevent the spread of infection and prevent the individual from contracting any airborne infectious germs. When someone coughs, talks, sneezes they could release germs into the air that may infect others nearby. Face masks are part of an infection control strategy to eliminate cross-contamination.',
    ),);
    addItem(TileData(
      id: '3',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Stay Home',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/3.json',
      description: 'The Epidemic is the biggest public health emergency in a generation, and being at home calls for decisive action which should help reduce the spread of the virus.',
    ));
    addItem(TileData(
      id: '4',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Keep Away From Others',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/4.json',
      description: 'In the time of pandemic disease sprading, being away from others helps to prevent the disease soread and also it helps to keep us safe, Also it helps find where from the disease is spreading.',
    ));
    addItem(TileData(
      id: '5',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Kill Gems by Sanitiser',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/5.json',
      description: 'You know you need to keep your hands clean. As much as your hands serve you, they also put germs in contact with your mouth, eyes, nose, and many other parts of your body. We hope you’re already washing your hands with soap and warm water multiple times a day, as that is the best way to clean them, but in the time of Pandemic spread, another worthy alternative is hand sanitizer.So add sanitizer to your shopping list now..',
    ));
    addItem(TileData(
      id: '6',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Keep Testing Body Frequently',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/6.json',
      description: 'Frequent self-examination of body at the time of the spread of the infection is necessary.If there is any change in body isolate Ourself.',
    ));
    addItem(TileData(
      id: '7',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Avoid HandShake',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/7.json',
      description: 'We should avoid shaking hands with our others in times of infection. This is because it prevents the spread of disease from others.',
    ));addItem(TileData(
      id: '8',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Eat Healthy Foods',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/8.json',
      description: 'The best way to protect us from before or after infection is to increase our body`s immunity.Eat healthy foods to boost immunity.',
    ));
    addItem(TileData(
      id: '9',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Maintain Your Fitness',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/9.json',
      description:'Daily yoga and exercise are essential to stay healthy and boost immunity. It also reduces our stress and Increase patience.',
    ));
    addItem(TileData(
      id: '10',
      noFillColor: Colors.white,
      yesFillColor: Colors.white,
      title: 'Consider Doctors',
      textColor: Colors.black,
      color: Colors.white.withOpacity(0),
      image: 'assets/PandemicAssets/10.json',
      description: 'It is best to consult a doctor if there is any change in the body.',
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network('https://images.pexels.com/photos/2280571/pexels-photo-2280571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',fit: BoxFit.cover,),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white.withOpacity(0.7)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(icon:
                        Icon(Icons.arrow_back,
                        color: Colors.black,),
                            onPressed: () => Navigator.pop(context)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Learned from Pandemic',
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (ind){
                    setState(() {
                      currentIndex = ind;
                    });
                  },
                  controller: pageController,
                  itemCount: tiles.length,
                  itemBuilder: (context,index){
                    return buildItem(tiles[index]);
                  },
                )
              ),
              if(currentIndex < tiles.length - 1)
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if(currentIndex > 0)
                    GestureDetector(
                      onTap: (){
                        pageController.animateToPage(currentIndex - 1,
                            duration: Duration(milliseconds: 150), curve: Curves.bounceIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back,color: Colors.black,),
                          radius: 25.0,
                        ),
                      ),
                    ),
                  SizedBox(width: 100.0,),
                  ButtonTheme(
                    minWidth: 180.0,
                    height: 50.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      disabledColor: Colors.grey,
                        textColor: onDone() ? Colors.white : Colors.black,
                        color: onDone() ? Colors.green : Colors.grey,
                        onPressed: (){
                         if(onDone()){
                           pageController.animateToPage(currentIndex+1,
                               duration: Duration(milliseconds: 150), curve: Curves.bounceIn);
                         }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Forward'),
                            Icon(Icons.arrow_forward,
                              color: onDone() ? Colors.white : Colors.black,
                            )
                          ],
                        )),
                  ),
                ],
              ),),
              if(currentIndex == tiles.length - 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(currentIndex > 0)
                      GestureDetector(
                        onTap: (){
                          pageController.animateToPage(currentIndex - 1,
                              duration: Duration(milliseconds: 150), curve: Curves.bounceIn);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_back,color: Colors.black,),
                            radius: 25.0,
                          ),
                        ),
                      ),
                    SizedBox(width: 100.0,),
                    ButtonTheme(
                      minWidth: 180.0,
                      height: 50.0,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          disabledColor: Colors.grey,
                          textColor:Colors.white,
                          color:  Colors.green,
                          onPressed: (){
                            int myPosition = 0;
                            List<VerifyData> verifyData = [];

                            for(int i = 0; i < tiles.length ;i++){
                              int myI = i + 1;
                              verifyData.add(VerifyData(slogan: tiles[i].title,
                              myOption: yesData.contains(myI.toString()) ? true : false));
                            }
                            for(int i = 0 ;i < verifyData.length;i++){
                              if(verifyData[i].myOption == false){
                                setState(() {
                                  myPosition = myPosition + 1;
                                });
                              }
                              print(myPosition.toString());
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return verifyScreen(verifyData,myPosition);
                            }));
                          },
                          child: Text('How I am ?'),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }


  bool onDone(){
    int index = currentIndex + 1;
    print('Current Index : $index');
    if(yesData.contains(index.toString()))
      return true;
    else if(noData.contains(index.toString()))
      return true;
    else
      return false;
  }


  void addItem(TileData tileData) {
    final int _index = tiles.length;
    print('Index $_index');
    tiles.add(tileData);
  }

  Widget verifyScreen(List<VerifyData> data,int myPosition){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('How I am ?',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Scaffold(
          body: Column(
            children: [
              Flexible(
                child: Container(
                child: ListViewEffect(
                  duration: Duration(milliseconds: 200),
                  children: data.map((s) => verifyItem(s.slogan, s.myOption)).toList())),
              ),
              if(myPosition >= 5)
                Lottie.asset(
                    'assets/PandemicAssets/more than 5.json',
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover),
              if(myPosition >= 3 && myPosition < 5)
                Lottie.asset(
                    'assets/PandemicAssets/more than 3.json',
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover),
              if(myPosition < 3)
                Lottie.asset(
                    'assets/PandemicAssets/less than 3.json',
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ButtonTheme(
                  minWidth: 180.0,
                  height: 50.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    disabledColor: Colors.grey,
                    textColor:Colors.white,
                    color:  Colors.green,
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return MyHomePage();
                      }));
                    },
                    child: Text('Thank You!'),),
                ),
              ),
            ],
          )));
  }

  Widget verifyItem(String text,bool myOption){
    return new Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: new Text(
                  text, style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
            ),
            myOption ? Icon(Icons.check_circle,color: Colors.green,) : Icon(Icons.cancel,color: Colors.red,)
          ],
        )
    );
  }

  Widget buildItem(TileData tileData){
    return MyTile(
      title: tileData.title,
      description: tileData.description,
      color: tileData.color,
      yesFilColor: yesData.contains(tileData.id) ? Colors.green : tileData.yesFillColor,
      noFilColor: noData.contains(tileData.id) ? Colors.red : tileData.noFillColor,
      textColor: tileData.textColor,
      noClick: (val){
        print('ID : ${tileData.id}');
        if(val == true){
          if(noData.contains(tileData.id)){
            setState(() {
              noData.remove(tileData.id);
            });
          }
          if(yesData.contains(tileData.id)){
            setState(() {
              yesData.remove(tileData.id);
              noData.add(tileData.id);
            });
          }
          else{
            setState(() {
              noData.add(tileData.id);
            });
          }
        }
      },
      yesClick: (val){
        print('ID : ${tileData.id}');
        if(val == true){
          if(yesData.contains(tileData.id)){
            setState(() {
              yesData.remove(tileData.id);
            });
          }
          if(noData.contains(tileData.id)){
            setState(() {
              noData.remove(tileData.id);
              yesData.add(tileData.id);
            });
          }
          else{
            setState(() {
              yesData.add(tileData.id);
            });
          }
        }
      },
      image: tileData.image,
    );

}
}

