part of loop;

typedef Future Effect<S>(Channel<Action> actions, S state);

final noEffect = (actions, state) => new Future.value();

Effect parallelEffect(Iterable<Effect> effects) {
  return (Channel<Action> actions, state) {
    return Future.wait(effects.map((effect) => effect(actions, state)));
  };
}

Effect sequentialEffect(Iterable<Effect> effects) {
  return (Channel<Action> actions, state) {
    return Future.forEach(effects, (effect) => effect(actions, state));
  };
}

/// An abstract effect that implements the [Effect] typedef.
abstract class BaseEffect<S> {
  Future call(Channel<Action> actions, S state);
}
