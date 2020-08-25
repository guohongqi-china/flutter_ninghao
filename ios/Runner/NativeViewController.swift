//
//  NativeViewController.swift
//  Runner
//
//  Created by guohongqi on 2020/8/25.
//

import UIKit
import Flutter

protocol NativeViewControllerHandle :NSObjectProtocol{
    func callBackFlutter() -> Void
}

class NativeViewController: UIViewController {
    
    //单项管道，有可能使用多次
//    @property (nonatomic, copy) FlutterEventSink eventSink;
    var eventSink:FlutterEventSink?
    var handle:NativeViewControllerHandle?
    
    var name:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        
        let flutterVC =  FlutterViewController();
        let Wchannel = FlutterMethodChannel(name: "wg/native_post", binaryMessenger: flutterVC.binaryMessenger) as FlutterMethodChannel
        
        Wchannel.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) in
            print("---->call.method=\(call.method) \n call.arguments = \(call.arguments ?? "")")

        }
    

    }
    
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    
    //Mark: - 基本设置
    
    func settingView(){
        self.title = "原生iOS界面"
        self.view.backgroundColor = UIColor.white
        
//        FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.nativeToFlutter" binaryMessenger:flvc];
//          [eventChannel setStreamHandler:self];
        
    
        
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 200, width: 100, height: 40))
        button.setTitle("返回flutter界面，并传递参数", for: UIControl.State.normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(goFlutterAction), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
    }
    
    
    @objc func goFlutterAction()  {
        if self.handle != nil && ((self.handle?.responds(to: Selector.init(("callBackFlutter")))) != nil){
            self.handle?.callBackFlutter()
        }

//        let flutterVC = FlutterViewController()
//        flutterVC.setInitialRoute("home")
//
//        let eventChannel = FlutterEventChannel(name: "wg/native_post", binaryMessenger: flutterVC.binaryMessenger)
//        eventChannel.setStreamHandler(self)
        self.navigationController?.popViewController(animated: true)
//        self.navigationController?.pushViewController(flutterVC, animated: true)


    }


}

extension NativeViewController:FlutterStreamHandler{
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events;
        if let sink = self.eventSink{
            sink("原生push到fluttet页面,传给flutter的值")
        }
        // arguments flutter监听时,给native传送的参数
        return nil;

    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}

