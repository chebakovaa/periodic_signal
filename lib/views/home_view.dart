import 'package:flutter/material.dart';
import 'package:simple_timer/views/settings_view.dart';
import 'package:simple_timer/views/timer_view.dart';
import 'package:simple_timer/vm_Time.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  // static const String TIME_TITLE = "Интервал, мин";
  // Timer timer;
  // bool needStop;
  // bool running;
  // String _title;
  // // int _interval = 600;
  // // int _balance;
  // Future<int> _soundId;
  // int _alarmSoundStreamId;
  // PageController _pageController;
  // TextEditingController _timeController;

  // static const double BORDER_WIDTH = 2;
  // static const int BORDER_COLOR = 0xff000000;
  // static const double BORDER_RADIUS = 6.0;

  // final InputBorder _border = UnderlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
  //   borderSide: BorderSide(width: BORDER_WIDTH, color: Color(BORDER_COLOR)),
  // );

  // final TextStyle _style = TextStyle(
  //     fontFamily: 'Montserrat',
  //     fontSize: 20.0,
  //     color: Color(BORDER_COLOR),
  //     fontStyle: FontStyle.normal);

  // @override
  // _MyHomePageState createState() => _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    PageController _pageController;

    // Using the reactive constructor gives you the traditional viewmodel
    // binding which will excute the builder again when notifyListeners is called.
    return ViewModelBuilder<TimeViewModel>.reactive(
      viewModelBuilder: () => TimeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(this.title),
          ),
          body: PageView(
            allowImplicitScrolling: true,
            controller: _pageController,
            children: <Widget>[TimerView(), SettingsView()],
          )),
    );
  }
}
