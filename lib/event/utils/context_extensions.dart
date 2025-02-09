import 'package:evently/event/core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  UserProvider get userProvider {
    return Provider.of(this);
  }
}
