part of loop.example.login_form.views.login;

class State {
  final LoginOrSignup selectedView;

  // Signup validations
  final Option<String> usernameError;
  final Option<String> passwordError;

  // Login errors
  final Option<String> loginError;

  State._(this.selectedView, {String usernameError, String passwordError, String loginError})
      : this.usernameError = new Option(usernameError),
        this.passwordError = new Option(passwordError),
        this.loginError = new Option(loginError);

  factory State.initial() => new State._(LoginOrSignup.signup);
}

enum LoginOrSignup { login, signup }
