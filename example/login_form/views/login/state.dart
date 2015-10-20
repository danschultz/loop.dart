part of loop.example.login_form.views.login;

class State {
  final LoginOrSignup selectedView;

  State._(this.selectedView);

  factory State.initial() => new State._(LoginOrSignup.signup);
}

enum LoginOrSignup { login, signup }
