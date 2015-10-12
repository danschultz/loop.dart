part of dedux.example.reddit.views.app;

Effect fetchPosts(String term) {
  return (Channel<Action> actions, State state) async {
    actions.add(new SearchAction(term));

    var response = await HttpRequest.getString("https://www.reddit.com/r/$term.json");
    var json = JSON.decode(response);
    actions.add(new FetchedPostsAction(json["data"]["children"]));
  };
}
