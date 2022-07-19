import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Your feedback is appreciated."),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15 ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 150),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Name:",
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Email:",
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        maxLines: 7 ,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Message:",
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          color: Colors.black,
                          onPressed:(){},
                          child: Text("SUBMIT",style:TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                      )
                    ],
                  ),
                ) ],
            )
        ));
  }
}

