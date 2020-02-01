import 'package:audioplayerui/audioplayerui.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cows',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var intro = 'Cows are members of the sub-family ‘Bovinae’ of the family ‘Bovidae’. This family also includes Gazelles, Buffalo, Bison, Antelopes, Sheep and Goats.';
  AudioPlayerController audioPlayerController = AudioPlayerController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[100],
      
      body: DoubleBackToCloseApp(
        child: Stack(
             fit: StackFit.expand,
             children: <Widget>[

      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //load svg file
                new Container(
                  margin: EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  'assets/images/cow.svg',      // color: Colors.red,
                  width: 100.0,
                  height: 180.0,        //180 fit ok, 200 max
                ),
                ),

              new Container( margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0), 
                child: Text(intro, style: GoogleFonts.indieFlower(fontSize: 20.0, fontWeight: FontWeight.bold),),),

                
          SizedBox(height: 30.0,),

                // circle button
                // ClipOval(
                //     child: Material(
                //       color: Colors.white,
                //       child: InkWell(
                //         splashColor: Colors.red, // inkwell color
                //         child: SizedBox(width: 56, height: 56, child: Icon(EvaIcons.music, color: Colors.blue, size: 30.0,)),
                //         onTap: () {},
                //       ),
                //     ),
                //   ),

                //* audio player with ui
              Container( padding: EdgeInsets.all(30.0),
              child: AudioPlayerView(
              audioPlayerController: audioPlayerController,
              trackUrl: "https://ask-queries2contact.000webhostapp.com/files/audio/cow%20(online-audio-converter.com).mp3",
              isLocal: false,
              trackTitle: "",
              trackSubtitle: "",
              imageUrl: "",
              simpleDesign: true,
              ),),
   
          ],
        ), 
      ),







        ],
      ),
      snackBar: const SnackBar(
      content: Text('Tap back again to leave'),
          ),
      ),
    );
  }
}
