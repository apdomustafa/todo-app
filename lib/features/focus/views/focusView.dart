import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';

class FocusView extends StatefulWidget {
  const FocusView({super.key});

  @override
  State<FocusView> createState() => _FocusViewState();
}

class _FocusViewState extends State<FocusView> {
  CountDownController countDownController = CountDownController();
  String buttonText = 'Start Focus';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30, right: 24, left: 24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Focus Mode',
                style: AppStyles.styleLatoReguler20(context),
              ),
              const Gap(30),
              CircularCountDownTimer(
                duration: 21600,
                initialDuration: 0,
                controller: countDownController,
                width: 213.w,
                height: 213.w,
                ringColor: AppColors.timerColor,
                fillColor: AppColors.primaryColor,
                backgroundColor: Colors.transparent,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: AppStyles.styleLatoMeduim40(context),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: false,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
              ),
              const Gap(10),
              Text(
                textAlign: TextAlign.center,
                'While your focus mode is on, all of your notifications will be off',
                style: AppStyles.styleLatoReguler16(context),
              ),
              const Gap(10),
              CustomButton(
                  text: buttonText,
                  onpress: () {
                    setState(() {
                      if (buttonText == 'Start Focus') {
                        buttonText = 'Stop Focus';
                        countDownController.start();
                      } else if (buttonText == 'Stop Focus') {
                        buttonText = 'Start Focus';
                        countDownController.reset();
                      }
                    });
                  }),
              const Gap(10),
              AspectRatio(
                aspectRatio: 1.5,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: const Color(0xff2c4260),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 6,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                );
                                Widget text;
                                switch (value.toInt()) {
                                  case 0:
                                    text = const Text('SUN', style: style);
                                    break;
                                  case 1:
                                    text = const Text('MON', style: style);
                                    break;
                                  case 2:
                                    text = const Text('TUE', style: style);
                                    break;
                                  case 3:
                                    text = const Text('WED', style: style);
                                    break;
                                  case 4:
                                    text = const Text('THU', style: style);
                                    break;
                                  case 5:
                                    text = const Text('FRI', style: style);
                                    break;
                                  case 6:
                                    text = const Text('SAT', style: style);
                                    break;
                                  default:
                                    text = const Text('', style: style);
                                    break;
                                }
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: text,
                                );
                              },
                              reservedSize: 42,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                );
                                String text = '${value.toInt()}h';
                                return Text(text,
                                    style: style, textAlign: TextAlign.left);
                              },
                              interval: 1,
                              reservedSize: 28,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(toY: 2.5, color: Colors.grey)
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(toY: 3.5, color: Colors.grey)
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(toY: 5, color: Colors.grey)
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(toY: 3, color: Colors.grey)
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(toY: 4, color: Colors.grey)
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(toY: 4.5, color: Colors.blue)
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(toY: 2, color: Colors.grey)
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
