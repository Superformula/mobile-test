#import "FlutterQrLibPlugin.h"
#if __has_include(<flutter_qr_lib/flutter_qr_lib-Swift.h>)
#import <flutter_qr_lib/flutter_qr_lib-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_qr_lib-Swift.h"
#endif

@implementation FlutterQrLibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQrLibPlugin registerWithRegistrar:registrar];
}
@end
