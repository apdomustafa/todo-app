import 'package:flutter_bloc/flutter_bloc.dart';

class CalenderObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: ${transition.currentState} -> ${transition.nextState}');
  }
}
