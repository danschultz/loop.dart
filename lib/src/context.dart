part of dedux;

class Context<S> {
  final _actions = new Channel<Action>.broadcast();
  final _effects = new Channel<Effect>();

  Property<S> _state;
  Property<S> get state => _state;

  Context(S initialState, Reducer<S> reducer) {
    _state = _actions.stream.scan(initialState, (S state, action) => reducer(state, action)).asProperty();
    _effects.stream.listen((effect) async => effect(_actions, await state.first));
  }

  void dispatch(actionOrEffect) {
    if (actionOrEffect is Action) {
      dispatchAction(actionOrEffect);
    } else if (actionOrEffect is Effect) {
      dispatchEffect(actionOrEffect);
    }
  }

  void dispatchAction(Action action) {
    _actions.add(action);
  }

  void dispatchEffect(Effect effect) {
    _effects.add(effect);
  }
}
