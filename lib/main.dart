import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import "dart:math";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project 3 - Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 16.0, fontFamily: 'Hindi', fontWeight: FontWeight.bold),
    ),
      ),
      home: MyHomePage(title: 'Andres Arizala - Flutter',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

      Widget candidateInfo() {
      return Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                        Text('Andres Arizala', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
                        Text('arizala13@gmail.com',), 
                        Text('https://github.com/arizala13'),
                        Text(''),
                      ],
                    )
        ],
      );
    }

    Widget candidateJobInfo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
              spacing: 60, 
            children: <Widget>[
                        Text('Verizon',),
                        Text('2013-Present'), 
                        Text('Houston, Texas')
                      ],
                    )
        ],
      );
    }

        Widget candidateJobDescription() {
      return Row(
        children: <Widget>[
          Expanded(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                          Text('Exceed in all key metrics by engaging with customers and selling solutions that create the best customer experience possible in doing so ranked in the top 20% of all Solutions Specialists in the South Central Market for 2014, 2015, 2016 and 2017. For 2018 I ranked in the TOP 10%.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
                          Text(''),
                        ],
                      ),
          )
        ],
      );
    }


  var element = ' ';
  var list = ['Yes you will!','Probably not.. :(','What do you think?','hmmm maybe?!','Of course!'];

  final _random = new Random();

  void changeData(){
    setState(() {
      element = list[_random.nextInt(list.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true, 
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.help_outline)),
              ],
            ),
            title: Text('Andres Arizala - Flutter'),
          ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Flexible(
                    child: SizedBox(
                      child: Image.asset('assets/Andres-Arizala.jpg')),
                  ),
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
                      onTap: () => launch('mailto:arizala13@gmail.com?subject=<subject>&body=<body>'),
                      child: Text('arizala13@gmail.com \n', textAlign: TextAlign.center))
                      ),
                    ], 
                  ),
                ],
              ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[ candidateInfo(), 
                  Column(
                    children: <Widget>[candidateJobInfo(),
                    ]
                  ),
                  Column(
                      children: <Widget>[ candidateJobDescription(),
                      ], 
                  ),
                ],
              ),
            ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('Will you get your dream job? \n',)),
                  Center(child: GestureDetector(
                    onTap: changeData,
                      child: Text("TAP HERE! We will show your future below... \n"),
                      ),),
                  Center(child: Text("$element",)),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
