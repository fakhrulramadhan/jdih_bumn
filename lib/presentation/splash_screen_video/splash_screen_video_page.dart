// import 'dart:async';
// import 'dart:io';

// import 'package:export_video_frame/export_video_frame.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // Try running your application with "flutter run". You'll see the
// //         // application has a blue toolbar. Then, without quitting the app, try
// //         // changing the primarySwatch below to Colors.green and then invoke
// //         // "hot reload" (press "r" in the console where you ran "flutter run",
// //         // or simply save your changes to "hot reload" in a Flutter IDE).
// //         // Notice that the counter didn't reset back to zero; the application
// //         // is not restarted.
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: SplashScreenVideoPage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// class SplashScreenVideoPage extends StatefulWidget {
//   const SplashScreenVideoPage({Key? key, required this.title})
//       : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _SplashScreenVideoPageState createState() => _SplashScreenVideoPageState();
// }

// class _SplashScreenVideoPageState extends State<SplashScreenVideoPage> {
//   final int _counter = 0;
//   String thumbNailImage = '';
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/video/splash_screen.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {
//           Future.delayed(Duration.zero, () async {
//             final byteData =
//                 await rootBundle.load("assets/video/splash_screen.mp4");
//             Directory tempDir = await getTemporaryDirectory();

//             File tempVideo =
//                 File("${tempDir.path}/assets/video/splash_screen.mp4")
//                   ..createSync(recursive: true)
//                   ..writeAsBytesSync(byteData.buffer.asUint8List(
//                       byteData.offsetInBytes, byteData.lengthInBytes));

//             final thumbnailFile = await VideoCompress.getFileThumbnail(
//                 tempVideo.path,
//                 quality: 50, // default(100)
//                 position:
//                     (_controller.value.duration.inMilliseconds) // default(-1)
//                 );

//             var duration = _controller.value.duration;
//             var image = await ExportVideoFrame.exportImageBySeconds(
//                 tempVideo, const Duration(seconds: 3), 0);

//             thumbNailImage = image.path;

//             // final fileName = await VideoThumbnail.thumbnailFile(
//             //   video: tempVideo.path,
//             //   thumbnailPath: (await getTemporaryDirectory()).path,
//             //   imageFormat: ImageFormat.JPEG,
//             //   timeMs: _controller.value.duration.inMilliseconds,
//             //   maxHeight: MediaQuery.of(context).size.height.toInt(),
//             //   //quality: 100,
//             // );
//             //thumbNailImage = fileName!;
//             print(
//                 "file name = $thumbNailImage video duration = ${_controller.value.duration.inMilliseconds}");
//             setState(() {});
//           });
//         });
//       });

//     // Timer(const Duration(seconds: 4), () {
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(builder: (context) => const MainMenuScreen()),
//     //   );
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the SplashScreenVideoPage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: thumbNailImage != ''
//           ? Image.file(
//               File(thumbNailImage),
//               fit: BoxFit.contain,
//             )
//           : Container(), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
