import 'package:flutter/cupertino.dart';
import 'package:todo_app2/core/theming/colors.dart';

class SplashViewIndicators extends StatefulWidget {
  const SplashViewIndicators({super.key, required this.viewNumber});
  final int viewNumber;

  @override
  State<SplashViewIndicators> createState() => _SplashViewIndicatorsState();
}

class _SplashViewIndicatorsState extends State<SplashViewIndicators>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: 8, end: 20).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            index++;
            return Container(
              margin: const EdgeInsets.only(right: 4),
              height: 4,
              width: index == widget.viewNumber ? _animation.value : 8,
              decoration: BoxDecoration(
                color: index == widget.viewNumber
                    ? AppColors.labelColor
                    : AppColors.defultIndicatorColor,
              ),
            );
          }),
        );
      },
    );
  }
}
