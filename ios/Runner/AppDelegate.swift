import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let rootVC = FirstViewController()
    let navVC = UINavigationController(rootViewController: rootVC)
    navVC.navigationBar.isHidden = true
    self.window.rootViewController = navVC
    
//    mutualInteractive()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    // Mark: - 交互
    func mutualInteractive(){
        guard let controller = self.window.rootViewController as? FlutterViewController else {
            return
        }
        
        //Mark: -改造项目根控制器，flutter初始化的项目根controller是FlutterViewController，我们需要对他包装个UINavigationController，并且隐藏导航栏
        let navVC = UINavigationController(rootViewController: controller)
        navVC.navigationBar.isHidden = true
        self.window.rootViewController = navVC

        
        let Wchannel = FlutterMethodChannel(name: "flutter_native", binaryMessenger: controller.binaryMessenger) as FlutterMethodChannel
        
        Wchannel.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) in
            print("---->call.method=\(call.method) \n call.arguments = \(call.arguments ?? "")")

            let method = call.method as String
            
            if "pushSquarePage" == method{
                
                let nativeVC = NativeViewController()
                navVC.pushViewController(nativeVC, animated:true)
                result("hello 大家好，我是iOS数据")
            }
        }
        
//        let Wchannel1 = FlutterMethodChannel(name: "wg/native_post", binaryMessenger: controller.binaryMessenger) as FlutterMethodChannel
//        
//        Wchannel1.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) in
//            print("---->call.method=\(call.method) \n call.arguments = \(call.arguments ?? "")")
//
//            let method = call.method as String
//            
//        }
    }
}





