part of dedux.example.reddit.views.app;

class SearchAction implements Action {
  final String term;

  SearchAction(this.term);
}

class FetchedPostsAction implements Action {
  final Map posts;

  FetchedPostsAction(this.posts);
}
