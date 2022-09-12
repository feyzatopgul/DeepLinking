//
//  ViewController.swift
//  DeepLinking
//
//  Created by fyz on 7/19/22.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x:25 , y: 150, width: view.frame.size.width - 60, height: 50))
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 26)
        label.text = "Please choose an app"
        view.addSubview(label)
        
        let size = (view.frame.size.width - 200) / 2
        
        let fbButton = UIButton(frame: CGRect(x: 75, y: 250, width: size, height: size))
        view.addSubview(fbButton)
        fbButton.setBackgroundImage(UIImage(named: "facebook"), for: .normal)
        fbButton.addTarget(self, action: #selector(fbTapped), for: .touchUpInside)
        
        let instaButton = UIButton(frame: CGRect(x: 100 + size, y: 250, width: size, height: size))
        view.addSubview(instaButton)
        instaButton.setBackgroundImage(UIImage(named: "instagram"), for: .normal)
        instaButton.addTarget(self, action: #selector(instaTapped), for: .touchUpInside)
        
    }
    
    func deepLinkOrUpsell(urlString: String, storeId: Int) {
        guard let url = URL(string: urlString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url){
            //Deep link
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            //Upsell - open app store
            let vc = SKStoreProductViewController()
            vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: storeId)], completionBlock: nil)
            present(vc, animated: true)
        }
    }
    
    @objc func fbTapped(_ sender: UIButton){
        deepLinkOrUpsell(urlString: "fb://", storeId: 284882215)
    }
    
    @objc func instaTapped(_ sender: UIButton) {
        deepLinkOrUpsell(urlString: "instagram://app", storeId: 389801252)
    }

}

