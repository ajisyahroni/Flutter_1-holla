import 'package:flutter/material.dart';

// custom widget
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final questions = const [
    {
      'questionText': 'Warna favoritmu ?',
      'answers': [
        {
          'text': 'Merah',
          'value': 10,
        },
        {
          'text': 'Hijau',
          'value': 10,
        },
      ]
    },
    {
      'questionText': 'apa mata pelajaran favorit anda ketika sd ?',
      'answers': [
        {'text': 'IPA', 'value': 10},
        {'text': 'IPS', 'value': 20},
        {'text': 'MATEMATIKA', 'value': 30},
      ]
    },
  ];
  int totalValue = 0;

  void answerQuestion(int answer) {
    setState(() {
      totalValue = totalValue + answer;
      _questionIndex = _questionIndex + 1;
    });
  }

  void resetQuiz() {
    setState(() {
      totalValue = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: (_questionIndex < questions.length)
              ? Column(
                  children: [
                    Question(questions[_questionIndex]['questionText']),
                    //list of answer
                    ...(questions[_questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          buttonTitle: answer['text'],
                          selectHandler: () => answerQuestion(answer['value']));
                    }).toList(),
                  ],
                )
              // jika pertanyaan sudah habis
              : Center(
                  child: Column(
                    children: [
                      Text('congrates ' + totalValue.toString()),
                      RaisedButton(
                        child: Text('Reset'),
                        onPressed: resetQuiz,
                      )
                    ],
                  ),
                )),
    );
  }
}
