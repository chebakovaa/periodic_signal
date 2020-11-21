import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_timer/viewmodels/settings_viewmodel.dart';
import 'package:simple_timer/views/triangle_painter.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  static const String TIME_TITLE = "Интервал, мин";

  static const double BORDER_WIDTH = 2;
  static const int BORDER_COLOR = 0xff000000;
  static const double BORDER_RADIUS = 6.0;

  static const InputBorder _border = UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
    borderSide: BorderSide(width: BORDER_WIDTH, color: Color(BORDER_COLOR)),
  );

  static const TextStyle _style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 40.0,
      color: Color(BORDER_COLOR),
      fontStyle: FontStyle.normal);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Container(
          margin: new EdgeInsets.fromLTRB(40, 40, 40, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 230,
                      child: TextField(
                        controller: model.controller,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 80),
                        decoration: new InputDecoration(
                            labelText: TIME_TITLE,
                            labelStyle: _style,
                            enabledBorder: _border,
                            focusedBorder: _border,
                            border: _border),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RawMaterialButton(
                            onPressed: model.upValue,
                            child: CustomPaint(
                              painter: TrianglePainter(
                                strokeColor: Colors.grey[500],
                                strokeWidth: 3,
                                paintingStyle: PaintingStyle.stroke,
                              ),
                              child: Container(
                                height: 60,
                                width: 80,
                              ),
                            ),
                          ),
                          SizedBox(width: 80, height: 20),
                          RawMaterialButton(
                            onPressed: model.downValue,
                            child: CustomPaint(
                              painter: TrianglePainter(
                                strokeColor: Colors.grey[500],
                                strokeWidth: 3,
                                paintingStyle: PaintingStyle.stroke,
                                angle: pi,
                              ),
                              child: Container(
                                height: 60,
                                width: 80,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 80,
                          //   height: 80,
                          //   child: FloatingActionButton(
                          //     onPressed: model.upValue,
                          //     child: Text(
                          //       '+',
                          //       style: TextStyle(fontSize: 70),
                          //     ),
                          //   ), // This trailing comma makes auto-formatting nicer for build methods.
                          // ),
                          // SizedBox(
                          //   width: 80,
                          //   height: 80,
                          //   child: FloatingActionButton(
                          //     onPressed: model.downValue,
                          //     child: Text(
                          //       '-',
                          //       style: TextStyle(fontSize: 70),
                          //     ),
                          //   ), // This trailing comma makes auto-formatting nicer for build methods.
                          // )
                        ])
                  ])
            ],
          )),
    );
  }
}
