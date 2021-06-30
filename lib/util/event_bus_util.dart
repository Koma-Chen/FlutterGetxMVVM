import 'package:event_bus/event_bus.dart';

class EventBusUtil {
  EventBusUtil._();

  static EventBus _eventBus = new EventBus();

  static EventBus getInstance() {
    return _eventBus;
  }
}
