import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget  {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var lastPosition =0.0;
  var random = new Random();

  Tween _tween;

  AnimationController _animationController;
  Animation _animation;

  double getRandom(){


    return  random.nextDouble();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        vsync: this,duration: Duration(seconds: 1)
    );
    _tween=new Tween<double>(
      begin: random.nextInt(1).toDouble(),end: random.nextInt(1).toDouble()
    );
    _animationController.forward();
  }

 /* spinBooTle(){

    animationController=AnimationController(
        vsync: this,duration: Duration(seconds: 3)
    );

    animationController.forward();

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(

            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/floor.jpg",
            fit: BoxFit.fill,),
          ),
          Center(
            child: Container(
              child: RotationTransition(
                turns: Tween(begin: 0.0 ,end: getRandom() ).animate(new CurvedAnimation(parent: _animationController, curve: Curves.linear)),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _animationController=AnimationController(
                          vsync: this,duration: Duration(seconds: 1));
                      _tween=new Tween<double>(
                          begin: random.nextInt(1).toDouble(),end: random.nextInt(1).toDouble()
                      );
                      _animationController.forward();

                    });
                  },
                  child: Image.asset("assets/bottle.png",
                  width: 250,height: 250,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
