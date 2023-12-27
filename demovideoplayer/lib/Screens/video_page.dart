import 'package:demovideoplayer/Screens/utilis.dart';
import 'package:demovideoplayer/Screens/video_display_screen.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: Utilis.videoLink.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayScreen(
                                    videoUrl: Utilis.videoLink[index],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text("Video $index"),
                            ),
                          )),
                    ),
                  ))
            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           _displayTextInputDialog(context);
           // Add your FAB onPressed functionality here
         },
         backgroundColor: Colors.blue, // Set your desired background color
         child: Icon(Icons.add), // Set your desired icon
         shape: CircleBorder(),
       ),
    );
  }

TextEditingController textEditingController = TextEditingController();
  Future<void>_displayTextInputDialog(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
          title: const Text('Add a new video link') ,
        content: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: "Paste link of the video"
          ),
        ),
        actions: [
          MaterialButton(onPressed: (){

            if(textEditingController.text.isNotEmpty) {
              Utilis.videoLink.add(textEditingController.text);

            }
            setState(() {

            });

            Navigator.of(context).pop();
            textEditingController.clear();

          },
            textColor: Colors.white70,
            color: Colors.red,
            child: Text("ok"),
          )
        ],


      );
    });
  }

}
