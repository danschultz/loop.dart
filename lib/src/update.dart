part of loop;

class Update<S> {
  final S state;
  final Effect effect;

  Update(this.state, {Effect<S> effect}) : this.effect = effect ?? noEffect;
}
