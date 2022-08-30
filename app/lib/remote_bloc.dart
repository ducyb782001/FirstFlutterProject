import 'dart:async';

import 'remote_event.dart';
import 'remote_state.dart';

class RemoteBloc {
  var state = RemoteState(70);
  // 2 controller for event and state
  final eventController = StreamController<RemoteEvent>();
  final stateController = StreamController<RemoteState>();

  RemoteBloc() {
    eventController.stream.listen((event) {
      if (event is IncrementEvent) {
        state = RemoteState(state.volume + event.increment);
      } else if (event is DecrementEvent) {
        state = RemoteState(state.volume - event.decrement);
      } else {
        state = RemoteState(0);
      }

      // add state moi vao statecontroller
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}
