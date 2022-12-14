import 'package:casa_grande_adv/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Videoplayer());
  }
}

class Videoplayer extends StatefulWidget {
  Videoplayer({Key? key}) : super(key: key);

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  @override
  String Url =
      "https://firebasestorage.googleapis.com/v0/b/casa-grand-adv.appspot.com/o/hostel.mp4?alt=media&token=5a763dbf-7170-480e-96ff-63e3d317aefa";
  VideoPlayerController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(Url)
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          _controller!.value.isInitialized
              ? Expanded(
                  child: VideoPlayer(_controller!),
                )
              : Container()
        ],
      ),
    );
  }
}
