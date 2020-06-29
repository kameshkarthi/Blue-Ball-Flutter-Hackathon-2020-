import 'package:flutter/material.dart';

import 'ListBloc.dart';
import 'Tile.dart';

class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;

  ListViewEffect({Key key, this.duration, this.children});
  _ListViewEffect createState() => new _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {

  ListBloc _listBloc;

  initState(){
    _listBloc = new ListBloc();
    super.initState();
  }

  Widget build(BuildContext context) {

    _listBloc.startAnimation(widget.children.length, widget.duration);

    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.children.length,
        itemBuilder: (context, position){
        return  ItemEffect(
            child: widget.children[position],
            duration: widget.duration,
            position: position
        );
    });
  }

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }
}