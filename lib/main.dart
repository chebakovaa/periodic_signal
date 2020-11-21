import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_timer/app/locator.dart';
import 'package:simple_timer/views/home_view.dart';
// import 'package:soundpool/soundpool.dart';

//Soundpool _soundpool;

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //_soundpool = Soundpool();
  configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Timer',
      navigatorKey: Get.key,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Simple Timer'),
    );
  }
}

// class _MyHomePageState extends State<HomeView> {
//   static const String TIME_TITLE = "Интервал, мин";
//   Timer timer;
//   bool needStop;
//   bool running;
//   String _title;
//   int _interval = 600;
//   int _balance;
//   Future<int> _soundId;
//   int _alarmSoundStreamId;
//   TextEditingController _timeController;

//   static const double BORDER_WIDTH = 2;
//   static const int BORDER_COLOR = 0xff000000;
//   static const double BORDER_RADIUS = 6.0;

//   final InputBorder _border = UnderlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
//     borderSide: BorderSide(width: BORDER_WIDTH, color: Color(BORDER_COLOR)),
//   );

//   final TextStyle _style = TextStyle(
//       fontFamily: 'Montserrat',
//       fontSize: 20.0,
//       color: Color(BORDER_COLOR),
//       fontStyle: FontStyle.normal);

//   @override
//   void initState() {
//     super.initState();
//     _soundId = _loadSound();
//     needStop = false;
//     running = false;
//     _title = "Start";
//     _balance = 0;
//     _pageController = PageController();
//     _timeController =
//         new TextEditingController(text: (_interval / 60).round().toString());
//   }

//   @override
//   void dispose() {
//     _soundpool.dispose();
//     _pageController.dispose();
//     super.dispose();
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
//         appBar: AppBar(
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Text(widget.title),
//         ),
//         body: PageView(
//           allowImplicitScrolling: true,
//           controller: _pageController,
//           children: <Widget>[
//             Container(
//                 child: Center(
//                     child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   '${((_interval / 60).round()).toString()}',
//                   style: TextStyle(fontSize: 60),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: FloatingActionButton(
//                     onPressed: running ? _stopTime : _startTime,
//                     child: Text(
//                       '$_title',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ), // This trailing comma makes auto-formatting nicer for build methods.
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Text(
//                   '${((_balance / 60).floor()).toString()}:${((((_balance / 60 - (_balance / 60).floor()) * 100).floor() * 60 / 100).floor()).toString().padLeft(2, '0')}',
//                   style: TextStyle(fontSize: 60),
//                 ),
//               ],
//             ))),
//             Container(
//                 margin: new EdgeInsets.fromLTRB(40, 40, 40, 40),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 160,
//                       child: TextField(
//                         controller: _timeController,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 40),
//                         decoration: new InputDecoration(
//                             labelText: TIME_TITLE,
//                             labelStyle: _style,
//                             enabledBorder: _border,
//                             focusedBorder: _border,
//                             border: _border),
//                       ),
//                     ),
//                   ],
//                 ))
//           ],
//         ));
//   }

//   void _stopTime() {
//     setState(() {
//       running = false;
//       needStop = true;
//       _title = "Start";
//     });
//   }

//   void _startTime() {
//     _balance = _interval;
//     setState(() {
//       running = true;
//       _title = "Stop";
//       needStop = false;
//     });
//     debugPrint("Timer start");
//     new Timer.periodic(
//         new Duration(seconds: 1),
//         (Timer tm) => {
//               if (needStop) {tm.cancel()},
//               setState(() {
//                 _balance--;
//               }),
//               if (_balance == 0)
//                 {
//                   _playSound(),
//                   // SystemSound.play(SystemSoundType.click),
//                   _balance = _interval,
//                 },
//             });
//   }

//   Future<int> _loadSound() async {
//     var asset = await rootBundle.load("assets/music/chiller.mp3");
//     return await _soundpool.load(asset);
//   }

//   Future<void> _playSound() async {
//     var _alarmSound = await _soundId;
//     _alarmSoundStreamId = await _soundpool.play(_alarmSound);
//   }
// }
