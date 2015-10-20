part of dedux.example.reddit.views.app;

Update update(State state, Action action) {
  if (action is SearchAction) {
    return new Update(new State(new Some(action.term), true, state.posts), fetchPosts(action.term));
  } else if (action is FetchedPostsAction) {
    return new Update(new State(state.topic, false, new Some(action.posts)), noEffect);
  } else {
    return new Update(state, noEffect);
  }
}
