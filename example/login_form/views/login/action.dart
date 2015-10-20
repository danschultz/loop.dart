part of loop.example.login_form.views.login;

class Action extends loop.Action {}

class SwitchViewAction extends Action {
  final LoginOrSignup selectedView;
  SwitchViewAction(this.selectedView);
}
