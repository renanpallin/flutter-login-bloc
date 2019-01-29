import 'dart:async';
import 'validators.dart';

import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Function(String) get changeEmail => _email.sink.add;

  Stream<String> get password => _password.stream.transform(validatePassword);
  Function(String) get changePassword => _password.sink.add;

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  dispose() {
    _email.close();
    _password.close();
  }
}
