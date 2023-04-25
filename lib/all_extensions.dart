library all_extensions;

export 'scr/home.dart';
export 'scr/url_strategy_non_web.dart'
    if (dart.library.html) 'package:url_strategy/src/url_strategy_web.dart';
