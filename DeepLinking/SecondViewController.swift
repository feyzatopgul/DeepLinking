//
//  SecondViewController.swift
//  DeepLinking
//
//  Created by fyz on 7/19/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x:0 , y: 0, width: view.frame.size.width, height: 50))
        label.center = view.center
        label.textAlignment = .center
        label.text = "Second Page"
        label.font = .systemFont(ofSize: 26)
        label.textColor = .systemBlue
        view.addSubview(label)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
