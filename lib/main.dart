import 'package:flutter/material.dart';
import 'package:quizapp1/questions.dart';


void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Generic Quiz',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int count = 0;
  final tickIcon = Icon(Icons.check, color: Colors.green);
  final crossIcon = Icon(Icons.clear, color: Colors.redAccent);
  List<Icon> iconsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.all(25.0),
              color: Colors.grey,
              height: 250.0,
              width: 250.0,
              child: Text(
                questionsList[count].question,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.all(20),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              color: Colors.green,
              onPressed: (){ checkAnswer(true);},
            ),
            SizedBox(height: 10,),
            RaisedButton(
              padding: EdgeInsets.all(20),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              color: Colors.redAccent,
              onPressed: (){checkAnswer(false);},
            ),
            SizedBox(height: 10,),
            Container(child: Row(children: iconsList), height: 40,)
          ],
        ),
      ],
    );
  }

  checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      setState(() {
        iconsList.add(tickIcon);
        if (count < questionsList.length - 1 ) {
          count++;
          if(count >= questionsList.length - 1){
            count = 0;
            iconsList.clear();
          }
        }
      });
    }

    else {
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionsList.length - 1) {
          count++;
          if(count >= questionsList.length - 1){
            count = 0;
            iconsList.clear();
          }
        }
       });
    }
  }
  }











