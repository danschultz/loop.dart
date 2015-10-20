part of loop.example.login_form.views.app;

loop.Update<State> update(State state, loop.Action action) {
  if (action is UpdateLoginFormAction) {
    var loginUpdate = login.update(state.loginState, action.loginAction);
    return new loop.Update(new State._(loginUpdate.state), effect: loginUpdate.effect);
  } else {
    return new loop.Update(state);
  }
}
