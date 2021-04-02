import 'package:flutter/material.dart';
import 'package:web_admin/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run and done Admin',
      theme: ThemeData(
        primarySwatch: getMainColor(),
      ),
      home: AdminHomePage(title: 'Run and done Admin'),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminHomePage> {
  _onOrdersPressed() {
    setState(() {
      isOff = false;
      _body = _getState('Orders');
    });
  }

  Widget _body;

  bool isOff = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isOff
            ? null
            : AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(widget.title),
                actions: <Widget>[
                  ElevatedButton(
                      onPressed: _onOrdersPressed, child: const Text('Orders')),
                ],
              ),
        body: isOff
            ? Center(
                child: ElevatedButton(
                    onPressed: _onOrdersPressed,
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      backgroundColor: getMainColor(),
                    )),
              )
            : _body
        //Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child: _body,
        //),
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

Widget _getState(String forPage) {
  switch (forPage) {
    case 'Orders':
      {
        return Table(
          children: [
            TableRow(children: [TableCell(child: const Text('Дата'))])
          ],
        );
      }
  }

  return Text(forPage);
}
