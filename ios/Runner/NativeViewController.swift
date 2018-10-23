//
//  NativeViewController.swift
//  Runner
//
//  Created by Kevin McGill on 10/22/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter

@objc class NativeViewController: UIViewController {
    @IBAction func onClickMe(_ sender: UIButton) {
        let messenger = UIApplication.shared.keyWindow?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel.init(name: "flutter.rortega.com.basicchannelcommunication", binaryMessenger: messenger)
        channel.invokeMethod("message", arguments: "Hello from iOS native host")
    }
}
