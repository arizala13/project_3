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
                    child: Image.asset('assets/Andres-Arizala.jpg', width: 100, height: 100)),
                  Center(
                    children: <Widget>[
                      Center(child: Text('Andres Arizala \n', textAlign: TextAlign.center)),
                      Center(child: Text('832-215-9876 \n', textAlign: TextAlign.center)),
                      Center(child: Text('Andres Arizala \n', textAlign: TextAlign.center)),
                      Center(child: Text('arizala13@gmail \n', textAlign: TextAlign.center)),
                      Center(child: GestureDetector(onTap: () => launch('arizala13@gmail.com')),
                      )
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
