import Flutter
import UIKit
import XCTest

class RunnerTests: XCTestCase {

  func testExample() {
    // If you add code to the Runner application, consider adding tests here.
    // See https://developer.apple.com/documentation/xctest for more information about using XCTest.
      
  }
    private var methodChannel: FlutterMethodChannel?

    init() {
        self.methodChannel = FlutterMethodChannel(name: "SceneView",
                                 binaryMessenger: messenger)
        methodChannel?.setMethodCallHandler(onMethodCall)
    }

    private func onMethodCall(call: FlutterMethodCall, result: FlutterResult) {
        switch(call.method){
            case "rotate":
                rotateAction()
            default:
                result(FlutterMethodNotImplemented)
        }
    }
}
