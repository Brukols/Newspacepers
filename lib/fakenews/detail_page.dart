import 'package:epi_space/fakenews/fake_news.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final FakeNews fakenews;
  DetailPage({Key key, this.fakenews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 65.0),
        Icon(
          Icons.fiber_new,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          fakenews.title,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(fakenews.imgPath),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .7)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 20.0,
          top: 30.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final mediumContentText = Text(
      fakenews.intro,
      style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
    );
    final mediumContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 40, right: 40, top: 40),
      child: Center(
        child: Column(
          children: <Widget>[mediumContentText],
        ),
      ),
    );

    final bottomContentText = Text(
      fakenews.content,
      style: TextStyle(fontSize: 18.0),
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[topContent, mediumContent, bottomContent],
      ),
    );
  }
}
