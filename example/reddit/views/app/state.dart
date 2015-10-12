part of dedux.example.reddit.views.app;

class State {
  final Option<String> topic;
  final bool isFetching;
  final Option<Iterable<Map>> posts;

  State(this.topic, this.isFetching, this.posts);

  factory State.initial() {
    return new State(const None(), false, const None());
  }
}
