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
      _isOff = false;
      _body = _getState('Orders');
    });
  }

  Widget _body;

  bool _isOff = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _isOff
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
        body: _isOff
            ? Center(
                child: ElevatedButton(
                    onPressed: _onOrdersPressed,
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      backgroundColor: getMainColor(),
                    )),
              )
            : _body);
  }
}

Widget _getState(String forPage) {
  switch (forPage) {
    case 'Orders':
      {
        return DataTable(
          columns: [
            DataColumn(label: Text('Дата')),
            DataColumn(label: Text('Номер')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('02.04.2021')),
              DataCell(Text('123456'))
            ]),
            DataRow(cells: [
              DataCell(Text('03.04.2021')),
              DataCell(Text('564321'))
            ]),
          ],
          dividerThickness: 0,
        );
      }
  }

  return Text(forPage);
}
