part of loop.example.login_form.views.app;

view(loop.Dispatcher dispatcher, State state) {
  return _view({"dispatcher": dispatcher, "state": state});
}

var _view = registerComponent(() => new _View());

class _View extends Component {
  loop.Dispatcher get _dispatch => props["dispatcher"];
  State get _state => props["state"];

  render() {
    var loginActions = new loop.Channel<login.Action>();
    loginActions.stream.listen((action) => _dispatch(new UpdateLoginFormAction(action)));

    return div({"className": "login-form-app"}, [
      h1({}, "Login Form Demo"),
      login.view(loginActions.add, _state.loginState)
    ]);
  }
}
