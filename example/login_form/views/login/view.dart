part of loop.example.login_form.views.login;

view(loop.Dispatcher dispatcher, State state) {
  return _view({"dispatcher": dispatcher, "state": state});
}

var _view = registerComponent(() => new _View());

class _View extends Component {
  loop.Dispatcher get _dispatch => props["dispatcher"];
  State get _state => props["state"];

  render() {
    return div({"className": "login-form"}, [
      h2({}, "Login form"),
      _state.selectedView == LoginOrSignup.login ? _renderLogin() : _renderSignup()
    ]);
  }

  _renderSignup() {
    return div({"className": "login-form--signup"}, [
      "Signup",
      div({"className": "login-form--toggle", "onClick": (_) => _switchView(LoginOrSignup.login)}, [
        "Already have an account? Click to login."
      ])
    ]);
  }

  _renderLogin() {
    return div({"className": "login-form--login"}, [
      "Login",
      div({"className": "login-form--toggle", "onClick": (_) => _switchView(LoginOrSignup.signup)}, [
        "Don't have an account? Click to signup."
      ])
    ]);
  }

  void _switchView(LoginOrSignup view) {
    _dispatch(new SwitchViewAction(view));
  }
}
