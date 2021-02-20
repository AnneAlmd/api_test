import 'package:flutter/material.dart';

import '../controller/users_api.dart';

class ShowUserScreen extends StatefulWidget {
  @override
  _ShowUserScreenState createState() => _ShowUserScreenState();
}

class _ShowUserScreenState extends State<ShowUserScreen> {
  UsersApi usersInstance = UsersApi();
  var userName = 'Anne Almeida';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Json place holder',
          style: TextStyle(fontSize: 25),
        ),
        elevation: 10,
        backgroundColor: Colors.purple[400],
      ),
      body: FutureBuilder(
        future: usersInstance.fetchUsers(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.purpleAccent[400],
                      Colors.amber[100],
                      Colors.blue[400]
                    ])),
                    child: cardApi(),
                  ),
      ),
    );
  }

  Card cardApi() {
    return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      color: Color.fromRGBO(255, 255, 255, 0.4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Colors.white,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${usersInstance.user.length}',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Number of people in the list.',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            userName,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          randomNameButton(),
        ],
      ),
    );
  }

  FlatButton randomNameButton() {
    return FlatButton.icon(
      padding: EdgeInsets.all(10),
      hoverColor: Colors.amber,
      splashColor: Colors.deepPurple,
      icon: Icon(Icons.face_outlined),
      color: Colors.deepPurple[200],
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Colors.deepPurple[400],
          )),
      onPressed: () {
        setState(() {
          userName = usersInstance.randomUser().name;
        });
      },
      label: Text(
        'Change Person\'s Name',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
