part of loop.example.login_form.views.app;

class Action extends loop.Action {}

class UpdateLoginFormAction extends Action {
  final login.Action loginAction;
  UpdateLoginFormAction(this.loginAction);
}
