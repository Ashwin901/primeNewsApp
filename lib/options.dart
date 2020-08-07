import 'package:flutter/material.dart';
import 'constants.dart';

class Options extends StatefulWidget {
final title;
final  addEvent;
Options({this.title,this.addEvent});
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:15.0,left: 38.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: FlatButton(
              child: Text(widget.title[0],
                  style: screenStyle,
              ),
              color: Color(0xff7fdbda),
            onPressed: widget.addEvent[0],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: 50.0,
            child: FlatButton(
              child: Text(widget.title[1],
                style: screenStyle,
              ),
              color: Color(0xffade498),
            onPressed: widget.addEvent[1],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: 50,
            child: FlatButton(
              child: Text(widget.title[2],
                style: screenStyle,
              ),
              color: Color(0xffede682),
            onPressed:widget.addEvent[2],
            ),
          )
        ],
      ),
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
  super.dispose();
  }
}