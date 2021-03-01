import 'package:flutter_riverpod/flutter_riverpod.dart';

/// * Contains the configuration for the autoRefresh feature
final autoRefreshProvider = StateProvider<bool>((_) => false);
