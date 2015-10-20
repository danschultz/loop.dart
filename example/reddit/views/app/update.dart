part of dedux.example.reddit.views.app;

Update<State> update(State state, Action action) {
  if (action is SearchAction) {
    return new Update(new State(new Some(action.term), true, state.posts), effect: fetchPosts(action.term));
  } else if (action is FetchedPostsAction) {
    return new Update(new State(state.topic, false, new Some(action.posts)));
  } else {
    return new Update(state);
  }
}
