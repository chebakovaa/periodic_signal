import 'package:flutter/material.dart';
import 'package:simple_timer/timer_viewmodel.dart';
//import 'package:soundpool/soundpool.dart';
import 'package:stacked/stacked.dart';

//Soundpool _soundpool;

class TimerView extends StatelessWidget {
  const TimerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamTimerViewModel>.reactive(
      viewModelBuilder: () => StreamTimerViewModel(),
      builder: (context, model, child) => Container(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${model.interval}',
            style: TextStyle(fontSize: 70),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: FloatingActionButton(
              onPressed: model.changeState,
              child: Text(
                '${model.titleState}',
                style: TextStyle(fontSize: 60),
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
          Text(
            '${model.balance}',
            style: TextStyle(fontSize: 70),
          ),
        ],
      ))),
    );
  }
}
