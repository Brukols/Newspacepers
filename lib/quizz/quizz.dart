import 'package:epi_space/fakenews/fetch_fake_news.dart';
import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:epi_space/ImageDayRoute/ImageDayRoute.dart';
import 'package:epi_space/SearchImages/SearchImagesRoute.dart';
import 'package:flutter/material.dart';

class QuestionQuizz {
  String question;
  bool answer;
  IconData icon;
  Color color;

  QuestionQuizz(
      {this.question, this.answer, this.icon, this.color});
}

class Quizz extends StatefulWidget {
  Quizz({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListQuizzState createState() => _ListQuizzState();
}

class _ListQuizzState extends State<Quizz> {
  List quizz_list;

  @override
  void initState() {
    quizz_list = getQuizz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(29, 31, 72, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsRssRoute()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.thumb_down, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListPage(title: "Fake News")),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.thumbs_up_down, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.image, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageDayRoute()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchImagesRoute()),
                );
              },
            )
          ],
        ),
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
      title: Text("Quizz"),
      actions: <Widget>[
        Image(
            image: AssetImage("assets/icon/logo.png")
        )
      ],
    );

    ListTile makeListTile(QuestionQuizz question) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      dense : true,
      leading: Icon(question.icon, color: question.color, size: 40.0),
      title: Text(
        question.question,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children : <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor:Colors.greenAccent,
                  child: Text("Vrai"),
                onPressed: () {
                  setState(() {
                    if (question.answer == true) {
                      question.icon = Icons.thumb_up;
                      question.color = Colors.green;
                    } else {
                      question.icon = Icons.thumb_down;
                      question.color = Colors.red;
                    }
                  });
                },
              ),
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor:Colors.deepOrangeAccent,
                child: Text("Faux"),
                onPressed: () {
                  setState(() {
                    if (question.answer == false) {
                      question.icon = Icons.thumb_up;
                      question.color = Colors.green;
                    } else {
                      question.icon = Icons.thumb_down;
                      question.color = Colors.red;
                    }
                  });
                },
              ),
            ],
        ),
      ),
    );

    Card makeCardQuestion(QuestionQuizz question) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(29, 31, 72, 0.9)),
        child: makeListTile(question),
      ),
    );

    final makeBodyQuizz = Container(
      //decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: quizz_list.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCardQuestion(quizz_list[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
      appBar: topAppBar,
      body: makeBodyQuizz,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getQuizz() {
  return [
    QuestionQuizz(
        question: "X2948 est une exoplanète ?",
        answer: false,
        icon: Icons.thumbs_up_down,
        color: Colors.white,
    ),
    QuestionQuizz(
      question: "Il y a des astéroides qui croisent l'orbite de la Terre ?",
      answer: true,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "La Lune finira par s'écraser sur la Terre ?",
      answer: false,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "Si la Terre passe entre le Soleil et le centre de la galaxie, alors tout est fini ?",
      answer: false,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "Notre satellite naturel s'appelle la Lune ?",
      answer: false,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "La grande tâche rouge de Jupiter est un volcan de 27 000 kilomètres d'altitude ?",
      answer: false,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "Il y a de l'eau sur la Lune ?",
      answer: true,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "Le Soleil est au milieu de sa vie ?",
      answer: true,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
    QuestionQuizz(
      question: "Il y a 2 630 satellites actifs en orbite autour de la Terre ?",
      answer: true,
      icon: Icons.thumbs_up_down,
      color: Colors.white,
    ),
  ];
}