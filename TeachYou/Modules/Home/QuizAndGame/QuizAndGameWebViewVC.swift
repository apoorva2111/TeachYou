//
//  QuizAndGameWebViewVC.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 05/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import WebKit

class QuizAndGameWebViewVC: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var strWebViewUrl = ""
    
    @IBOutlet weak var viewWebView: UIView!
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpWebView()

    }

    
    func setUpWebView()  {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = false
        configuration.mediaTypesRequiringUserActionForPlayback = .video
        
        let frame = CGRect(x: 0, y: 0, width: self.viewWebView.frame.width + 10, height: self.viewWebView.frame.height + 20 )
        webView = WKWebView(frame: frame, configuration: configuration)
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        self.viewWebView.addSubview(webView)

        startLoading()

    }
    
    private func startLoading() {
        
        let url = URL(string: strWebViewUrl)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }


}
