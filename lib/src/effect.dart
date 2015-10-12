part of dedux;

typedef Future Effect<S>(Channel<Action> actions, S state);

final noEffect = (actions, state) => new Future.value();

/// An abstract effect that implements the [Effect] typedef.
abstract class BaseEffect<S> {
  Future call(Channel<Action> actions, S state);
}
