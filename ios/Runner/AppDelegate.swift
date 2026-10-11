import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Directory of the encrypted local DB, excluded from iCloud/iTunes backups
    // because its key is not backed up (D-33). See core/db/database_providers.dart.
    let dbChannel = FlutterMethodChannel(
      name: "app.onemoresip/db",
      binaryMessenger: engineBridge.applicationRegistrar.messenger())
    dbChannel.setMethodCallHandler { call, result in
      guard call.method == "databaseDirectory" else {
        result(FlutterMethodNotImplemented)
        return
      }
      do {
        result(try AppDelegate.databaseDirectory().path)
      } catch {
        result(FlutterError(code: "db_directory", message: nil, details: nil))
      }
    }
  }

  /// Library/Application Support/db, created if needed and marked as excluded
  /// from backup together with everything in it.
  private static func databaseDirectory() throws -> URL {
    var url = try FileManager.default
      .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      .appendingPathComponent("db", isDirectory: true)
    try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
    var values = URLResourceValues()
    values.isExcludedFromBackup = true
    try url.setResourceValues(values)
    return url
  }
}
