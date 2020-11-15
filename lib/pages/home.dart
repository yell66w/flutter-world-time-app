import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': res['location'],
                        'time': res['time'],
                        'flag': res['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location')),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
