part of loop.example.login_form.views.login;

loop.Update update(State state, Action action) {
  if (action is SwitchViewAction) {
    return new loop.Update(new State._(action.selectedView));
  } else {
    return new loop.Update(state);
  }
}
