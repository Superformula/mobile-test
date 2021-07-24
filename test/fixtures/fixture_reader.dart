import 'dart:io';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
