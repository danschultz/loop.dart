part of dedux.example.reddit.views.app;

State update(State state, Action action) {
  if (action is SearchAction) {
    return new State(new Some(action.term), true, state.posts);
  } else if (action is FetchedPostsAction) {
    return new State(state.topic, false, new Some(action.posts));
  } else {
    return state;
  }
}
