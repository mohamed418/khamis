import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState()) {}

  static AuthCubit get(context) => BlocProvider.of(context);

  int num = 1;
  late Timer _timer;

  void startIncrementTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      num += 1;
      emit(AuthIncrementState(num));
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
