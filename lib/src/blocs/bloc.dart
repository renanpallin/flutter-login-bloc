import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Function(String) get changeEmail => _email.sink.add;

  Stream<String> get password => _password.stream.transform(validatePassword);
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
