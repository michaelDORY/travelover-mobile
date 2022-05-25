import "package:flutter/material.dart";

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TraveLover",
      home: const Scaffold(
        body: const Auth(),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellowAccent,
        primarySwatch: Colors.yellow,
        fontFamily: 'Montserrat',
      )
    );
  }
}

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage('assets/planet.png'),
            ),
          Form(child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Submit"))
            ],
          ))
        ]
        ),
    );
  }
}