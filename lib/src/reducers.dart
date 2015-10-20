part of dedux;

typedef Update<S> Reducer<S>(S state, Action action);

class Update<S> {
  final S state;
  final Effect effect;

  Update(this.state, this.effect);
}
