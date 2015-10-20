part of loop.example.login_form.views.app;

class State {
  final Option<User> user;
  final login.State loginState;

  State._(this.loginState, {User user}) : this.user = new Option(user);

  factory State.initial() => new State._(new login.State.initial());
}
