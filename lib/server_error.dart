import 'package:flutter/material.dart';

import 'intro/utilities/styles.dart';

class ServerError extends StatefulWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  _ServerErrorState createState() => _ServerErrorState();
}

class _ServerErrorState extends State<ServerError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/No_connection2.gif'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Whoops !',
                  style: TextStyle(
                    color: primary.color,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'No internet connection found',
                  style: TextStyle(
                    color: primary.color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Check your connection or Try again',
                  style: TextStyle(
                    color: primary.color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
