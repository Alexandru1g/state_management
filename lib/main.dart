import 'package:flutter/material.dart';
import 'package:state_management/my_stateful_widget.dart';
import 'package:state_management/page_two.dart';
import 'package:state_management/screen_a.dart';
import 'package:state_management/screen_b.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _navigate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageTwo(
          counter: _counter,
          callback: (value) {
            setState(() {
              _counter = value;
            });
          },
        ),
      ),
    );
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ExampleStatefulPage(),
            TextButton(
              onPressed: () => {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => ScreenA(
                      callback: (value) {
                        setState(() {
                          _counter = value;
                        });
                      },
                      counter: _counter,
                    ),
                  ),
                ),
              },
              child: const Text(
                'Screen A',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () => {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => ScreenB(
                      callback: (value) {
                        setState(() {
                          _counter = value;
                        });
                      },
                      counter: _counter,
                    ),
                  ),
                ),
              },
              child: const Text(
                'Screen B',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
