import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
      override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDTZdVevKqk2Loqb3Bl-2oQkUH-O0HI-g8")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
  }
    

}
