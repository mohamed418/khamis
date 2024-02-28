abstract class AuthStates {}
// basic ot the man state
class AuthInitialState extends AuthStates {}

class AuthIncrementState extends AuthStates {
  final dynamic num;

  AuthIncrementState(this.num);
}
