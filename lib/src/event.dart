part of dbldart;

class _EventStream<T> extends Stream<T> {
  StreamController<T> _controller;
  Stream<T> _stream;

  _EventStream() {
    _controller = new StreamController.broadcast();
    _stream = _controller.stream;
  }

  StreamSubscription<T> listen(void onData(T event), {Function onError, void onDone(), bool cancelOnError}) => 
      _stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);

  void add(T event) => _controller.add(event);
  Future close() => _controller.close();
}

abstract class _EventExhibitor {
  final List<_EventStream> _events = [];

  _EventStream<VoteEvent> createEvent() {
    final event = new _EventStream<VoteEvent>();
    _events.add(event);

    return event;
  }

  Future<List> destroyEvents() => Future.wait(_events.map((event) => event.close()));
}