import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class Camera extends StatefulWidget {
  Camera({this.camera,this.name});
  final String camera;
  final String name;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras;
  CameraController controller;
  String imagepath ;
  XFile imageFile;
  String check = "not Working";


  @override
  void _fetchcams() async{
    cameras = await availableCameras();
    _initcam();
  }
  void _takeimages()async {

    final String path = (await getApplicationDocumentsDirectory()).path;

    XFile file = await controller.takePicture();

    setState(() {

      imageFile = file;
    });
    GallerySaver.saveImage(file.path , albumName: path );

  }
  // void _takeimages()async{
  //   XFile file=await controller.takePicture();
  //   // file.saveTo("");
  //   final String path = await(file.path);
  //   setState(() {
  //     imageFile= file;
  //   });
  //   Gallerysaver.saveImage(file.path,albumName:path);
  // }


  void _initcam(){
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  void _switchfrontcam(){
    var camDirection = controller.description.lensDirection;
    CameraController cameraController;
    CameraDescription camDescription = controller.description;
    if(camDirection==CameraLensDirection.front){
      camDirection=CameraLensDirection.back;
    }
    else
      camDirection=CameraLensDirection.front;
    for(CameraDescription cameraDescription in cameras){
      if(cameraDescription.lensDirection==camDirection){
        camDescription=cameraDescription;
      }
    }
    cameraController=CameraController(camDescription,ResolutionPreset.max);
    setState(() {
      controller=cameraController;
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  void initState(){
    super.initState();
    _fetchcams();
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child:_getcamwidget() ),
          Positioned(
            bottom: 65,
            left:20,
            child: GestureDetector(
              onTap: (){
                _takeimages();
              },
              child: Container(
                height:55,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //image: DecorationImage(),
                    color: Colors.pink
                ),
                child: Icon(Icons.inbox_outlined),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60,bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            widget.camera,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Incomming Video Call.....",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

                      ],
                    ),
                    Column(
                      children: [
                        Text("Swipe up to answer",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 30,),
                        Positioned(
                            bottom: 30,
                            right: 0,
                            left: 0,
                            child: Center(
                              child: FloatingActionButton(
                                onPressed: (){
                                  _switchfrontcam();
                                },
                                child: Icon(Icons.camera),
                              ),
                            )),
                        SizedBox(height: 30,),
                        Text("Swipe down to decline",style: TextStyle(color: Colors.grey[300],fontSize: 14,fontWeight: FontWeight.bold),),

                      ],
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _getcamwidget(){
    if(controller==null){
      return Container(
        child: Text("wait.."),
      );
    }
    if(!controller.value.isInitialized){
      return Container(
        child: Text("not initialized"),
      );
    }
    return CameraPreview(controller);
  }
}
