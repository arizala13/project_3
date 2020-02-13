import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.help_outline)),
              ],
            ),
            title: Text('Call Me Maybe'),
          ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 4 /2,
                    child: Image.asset('assets/Andres-Arizala.jpg')),
                   Column(
                    children: <Widget>[
                  Center(
                    child: Text('Andres Arizala \n', textAlign: TextAlign.center)
                    ),
                                      Center(
                    child: Text('Software Engineer \n', textAlign: TextAlign.center)
                    ),
                                      Center(child: GestureDetector(
                    onTap: () => launch('sms:8322159876'),
                    child: Text('832-215-9876 \n', textAlign: TextAlign.center))
                    ),
                                      Center(child: GestureDetector(
                    onTap: () => launch('https:github.com/arizala13'),
                    child: Text('github.com/arizala13 \n', textAlign: TextAlign.center))
                    ),
                                                          Center(child: GestureDetector(
                    onTap: () => launch('mailto:arizala13@gmail.com?subject=News&body=New%20plugin'),
                    child: Text('arizala13@gmail.com \n', textAlign: TextAlign.center))
                    ),
                    ], 
                  ),
                ],
              ),
              Text('Resume', textAlign: TextAlign.center,),
             Column(
                children: <Widget>[
                  Center(child: Text('Call Me... Maybe?', textAlign: TextAlign.center,)),
                  Center(child: Text('Ask a question...tap for the answer.', textAlign: TextAlign.center,)),
                  Center(child: Text('HERE GOES THE RANDOM THINGS', textAlign: TextAlign.center,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

