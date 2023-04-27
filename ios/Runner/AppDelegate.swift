import UIKit
import Flutter
import sqflite

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Registra la implementación de la plataforma de sqflite
    Sqflite.setPluginRegistrant(self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
