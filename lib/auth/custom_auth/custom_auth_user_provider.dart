import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class GDGPuneAuthUser {
  GDGPuneAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<GDGPuneAuthUser> gDGPuneAuthUserSubject =
    BehaviorSubject.seeded(GDGPuneAuthUser(loggedIn: false));
Stream<GDGPuneAuthUser> gDGPuneAuthUserStream() => gDGPuneAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
