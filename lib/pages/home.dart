import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    print(data);

    //set background

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    var bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('WORLD TIME APP',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),)
        
      ),
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');

                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text('Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ))),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 70.0),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 80,
                    shadowColor: Colors.black,
                    
                    color: Colors.orangeAccent,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/photo.jpg',
                            ),
                            radius: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('  Hi folks,',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                              Text('  this is Saptarshi Mandal',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Colors.black,
                                    ),
                                    Text('saptarshimandal125@gmail.com',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold)),

                                            
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('     Click the Edit Location',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
