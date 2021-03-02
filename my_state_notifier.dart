import 'package:state_notifier/state_notifier.dart';
import 'package:meta/meta.dart';



class MyState {
  MyState(this.count);
  final int count;
}

class MyStateNotifier extends StateNotifier<MyState> with LocatorMixin {
  MyStateNotifier() : super(MyState(0));

  void increment() {
    state = MyState(state.count + 1000);
  }

  @override
  @protected
  set state(MyState value) {
    super.state = value;
  }
}
