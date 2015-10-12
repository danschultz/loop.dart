import 'dart:html';
import 'package:dedux/dedux.dart';
import 'package:react/react.dart' as react;
import 'package:react/react_client.dart' as react_client;

import 'views/app.dart' as app;

void main() {
  react_client.setClientConfiguration();

  var appElement = querySelector("#application");
  var initialState = new app.State.initial();
  var context = new Context<app.State>(initialState, app.update);
  context.state.listen((state) => react.render(app.view(context, state), appElement));
}
