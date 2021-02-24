import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';
import 'package:mobile_test/src/styles/custom_styles.dart';
import 'package:mobile_test/src/utilities/navigator_util.dart';
import 'package:mobile_test/src/utilities/size_config.dart';

class CustomCountDownTimer extends StatelessWidget {
  const CustomCountDownTimer(this.time);
  final int time;
  @override
  Widget build(BuildContext context) {
    final int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * time;
    return Center(
      child: CountdownTimer(
        endTime: endTime,
        widgetBuilder: (_, CurrentRemainingTime time) {
          if (time == null) {
            return Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      getBlockSizeHorizontal(context) * 10,
                      10,
                      getBlockSizeHorizontal(context) * 10,
                      10),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: getBlockSizeHorizontal(context) * 3,
                          bottom: getBlockSizeHorizontal(context) * 3,
                        ),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Text(
                            'Expired pull down to refresh/tap button',
                            style: CustomStyles.defaultStyle
                                .copyWith(color: Colors.black),
                            textAlign: TextAlign.center,
                          ))
                        ])),
                    onPressed: () {
                      NavigatorUtil().pop(context);

                      NavigatorUtil().push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            settings: RouteSettings(
                                name: const GenerateQRCodeScreen()
                                    .runtimeType
                                    .toString()),
                            builder: (BuildContext context) =>
                                const GenerateQRCodeScreen()),
                      );
                    },
                  )),
            ]);
          } else {
            return Text('${time?.sec} s',
                style: CustomStyles.defaultStyle.copyWith(color: Colors.black));
          }
        },
      ),
    );
  }
}
