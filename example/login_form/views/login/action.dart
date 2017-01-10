part of loop.example.login_form.views.login;

class Action extends loop.Action {}

class SwitchViewAction extends Action {
  final LoginOrSignup selectedView;
  SwitchViewAction(this.selectedView);
}

class ValidateSignupAction extends Action {
  final String username;
  final String password;

  ValidateSignupAction(this.username, this.password);
}

class CreateAccountAction extends Action {
  final String username;
  final String password;

  CreateAccountAction(this.username, this.password);
}
