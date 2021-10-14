//
//  PDFViewViewController.swift
//  Gluco App
//
//  Created by Anjali on 11/6/21.
//

import UIKit
import WebKit
import PDFKit
class PDFViewViewController: UIViewController {

    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let pdfView = PDFView(frame: self.view1.bounds)
//            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(pdfView)

            // Fit content in PDFView.
            pdfView.autoScales = true

            // Load Sample.pdf file from app bundle.
            let fileURL = Bundle.main.url(forResource: "eula1", withExtension: "pdf")
            pdfView.document = PDFDocument(url: fileURL!)
        
        
        
//        let url = Bundle.main.url(forResource: "eula1", withExtension: "pdf")
//
//                   if let url = url {
//                    webView = WKWebView(frame: view1.frame)
//                       let urlRequest = URLRequest(url: url)
//                       webView.load(urlRequest)
//                       view1.addSubview(webView)
//                   }

    }
    

    

}
