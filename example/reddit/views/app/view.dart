part of dedux.example.reddit.views.app;

view(Dispatcher dispatcher, State state) => _view({"dispatcher": dispatcher, "state": state});

final _view = registerComponent(() => new _AppView());

class _AppView extends Component {
  Dispatcher get _dispatcher => props["dispatcher"];
  State get _state => props["state"];

  String get _searchTerm => state["searchTerm"];
  set _searchTerm(String value) => setState({"searchTerm": value});

  Channel<SyntheticKeyboardEvent> _onSubmit;
  Channel<SyntheticKeyboardEvent> _onChange;

  void componentWillMount() {
    super.componentWillMount();

    _onSubmit = new Channel();
    _onSubmit.stream.where((event) => event.keyCode == 13).listen((event) {
      _dispatcher(new SearchAction(event.target.value));
    });

    _onChange = new Channel(sync: true);
    _onChange.stream.listen((event) => _searchTerm = event.target.value);
  }

  render() {
    return div({
      "className": "reddit-reader"
    }, [
      div({}, [
        input({"type": "text", "placeholder": "Topic, i.e. Swift", "onKeyUp": _onSubmit, "onChange": _onChange}),
        span({}, _state.isFetching ? "Fetching posts" : "")
      ]),
      _renderPosts(_state.posts.getOrDefault([]))
    ]);
  }

  _renderPosts(Iterable<Map> posts) {
    return ul({"className": "reddit-reader--posts"}, posts.map((post) => _renderPost(post)).toList());
  }

  _renderPost(Map post) {
    return li({"className": "reddit-reader--post"}, post["data"]["selftext"]);
  }
}
