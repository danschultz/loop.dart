part of loop;

class Context<S> {
  final _actions = new Channel<Action>.broadcast();

  EventStream<Update<S>> _updates;

  Property<S> _state;
  Property<S> get state => _state;

  Context(S initialState, Reducer<S> reducer) {
    _updates = _actions.stream
        .scan(new Update(initialState), (Update<S> update, action) => reducer(update.state, action));

    _state = _updates
        .doAction((update) => update.effect(_actions, update.state))
        .map((update) => update.state)
        .asProperty();
  }

  void dispatch(Action action) {
    _actions.add(action);
  }
}
