import 'dart:io';
import 'package:flutter/material.dart';
import 'camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> names= ["Sunil","sandy","sunny","prasad","Sunil","sandy","sunny","prasad","Sunil","sandy","sunny","prasad","Sunil","sandy","sunny","prasad",];
  List<String> images=["img/img1.jpg","img/img2.jpg","img/img3.jpg","img/img4.jpg","img/img5.jpg","img/img6.jpg","img/img7.jpg","img/img8.jpg","img/img1.jpg","img/img2.jpg","img/img3.jpg","img/img4.jpg","img/img5.jpg","img/img6.jpg","img/img7.jpg","img/img8.jpg",];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edit",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600),),
                    Text("Calls",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                    Icon(Icons.more_vert,color: Colors.deepPurple,size: 20,)
                  ],
                ),
                SizedBox(height: 25,),
                Container(
                  height: 50,
                  width: 350,
                  child: Stack(
                    children: [

                      Positioned(
                        left: 0,
                        child: Container(

                          height: 50,
                          width: 175,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text("All" , style: TextStyle(color: Colors.purple),)),
                        ),
                      ),
                      Positioned(
                        right:0,
                        child: Container(
                          height: 50,
                          width: 185,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text("hai" ,style: TextStyle(color: Colors.grey),)),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: const Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: ListView.builder(
                    itemCount: names.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Calling(
                        name: names[index],
                        image: images[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined,color: Colors.purple,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined,color: Colors.grey,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dialpad_outlined,size: 25,color: Colors.purple,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded,color: Colors.grey,),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz,color: Colors.grey,),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class Calling extends StatefulWidget {
  const Calling({
    this.name,
    this.image,
    this.camera,

  }) ;
  final String name;
  final String image;
  final String camera;
  @override
  _CallingState createState() => _CallingState();
}

class _CallingState extends State<Calling> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(widget.image),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          Icon(Icons.call_missed,color: Colors.red,size: 18,),
                          Text("june 10 2021, 10:45PM",style: TextStyle(color: Colors.grey[400]),)
                        ],
                      )

                    ],
                  )
                ],
              ),
            ),
            Container(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Camera(camera: widget.image,name: widget.name,

                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){

                        },
                        child: Icon(Icons.call,color: Colors.purple[300],size: 22,)),
                    SizedBox(width: 9,),
                    Icon(Icons.videocam_outlined,color: Colors.purple[300],size: 25,)
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 15,),

      ],
    );
  }
}
