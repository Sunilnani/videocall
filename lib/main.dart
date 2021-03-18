
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
  String tabColor = "1";
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(

            child: Text(
                "Edit",
                style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600)),),),

        centerTitle: true,
        title: Text(
            "Calls",
            style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700) ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.purple,
            size: 25,
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Edit",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600),),
                    //     Text("Calls",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                    //     Icon(Icons.more_vert,color: Colors.deepPurple,size: 20,)
                    //   ],
                    // ),
                    Container(
                      height: 50,
                      width: 350,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  tabColor = "1";
                                });
                              },
                              child: Container(

                                height: 50,
                                width: 175,
                                decoration: BoxDecoration(
                                    color: tabColor == "1" ?  Colors.white : null,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(child: Text("All" , style: TextStyle(color: tabColor == "1" ?  Colors.purple : Colors.grey ,fontSize: 12),)),
                              ),
                            ),
                          ),
                          Positioned(
                            right:0,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  tabColor = "2";
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 185,

                                decoration: BoxDecoration(
                                    color : tabColor == "2" ?  Colors.white : null,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(child: Text("Missed" ,style: TextStyle(color:  tabColor == "2" ?  Colors.purple : Colors.grey  , fontSize: 12),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xfff8f8fa),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 1,

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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.only(topRight: Radius.circular(25) , topLeft: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(-1, -3),
                          blurRadius: 6)
                    ]),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.phone , color: Colors.purple, size: 20,),
                    Icon(Icons.message , color: Colors.black54,size: 20,),
                    CircleAvatar(
                      radius: 23,
                      child: Icon(Icons.dialpad_outlined,size: 25,color: Colors.purple,),
                    ),
                    Icon(Icons.person ,color: Colors.black54, size: 20,),
                    Icon(Icons.more_horiz ,color: Colors.black54,size: 20,),
                  ],
                )
            ),
          ),
        ],
      ),
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
