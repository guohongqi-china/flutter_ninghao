//
//  FirstViewController.swift
//  Runner
//
//  Created by guohongqi on 2020/8/25.
//

import UIKit
import Flutter

class FirstViewController: UIViewController {
    
    //单项管道，有可能使用多次
    //@property (nonatomic, copy) FlutterEventSink eventSink;
    var eventSinkBack:FlutterEventSink?

    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetting()
        loadFlutterView()
  
    }
    
    // Mark: - 基本设置
    private func baseSetting(){
        self.title = "11111"
        self.view.backgroundColor = UIColor.white
    }
    
    // Mark: - 加载flutter视图
    private func loadFlutterView(){
        
        let eventChannelName = "wg/native_post"
        let methodChannelName = "wg/native_get"
        
        let flutterVC = FlutterViewController()
        flutterVC.setInitialRoute("home")
        
        /*---------FlutterEventChannel是IOS主动与flutter交互-----------*/
        let eventChannel = FlutterEventChannel(name: eventChannelName, binaryMessenger: flutterVC.binaryMessenger)
        // 代理FlutterStreamHandler
        eventChannel.setStreamHandler(self)
        /*---------FlutterEventChannel是IOS主动与flutter交互-----------*/

        
        /*---------FlutterMethodChannel是flutter主动与IOS交互-----------*/
        let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: flutterVC.binaryMessenger) as FlutterMethodChannel

        methodChannel.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) in
            print("---->call.method=\(call.method) \n call.arguments = \(call.arguments ?? "")")

            let method = call.method as String
            
            if "pushSquarePage" == method{
                
                let nativeVC = NativeViewController()
                nativeVC.handle = self
                
                self.navigationController?.pushViewController( nativeVC, animated:true)
                result("hello 大家好，我是iOS数据")
            }
        }
        /*---------FlutterMethodChannel是flutter主动与IOS交互-----------*/
        self.navigationController?.pushViewController(flutterVC, animated: true)

    }


}


extension FirstViewController:FlutterStreamHandler{
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print("当前传递参数 \(String(describing: arguments))")
        
        self.eventSinkBack = events
        
        // arguments flutter监听时,给native传送的参数
        return nil;

    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}

extension FirstViewController:NativeViewControllerHandle{
    func callBackFlutter() {
        guard let back = self.eventSinkBack else {
            return
        }
        back("这是iOS主动传递给flutter的数值")
    }
}
