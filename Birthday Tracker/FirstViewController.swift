//
//  FirstViewController.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/18/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (Bool) in
            let tbc = self.storyboard!.instantiateViewController(identifier: "mainSID")
            tbc.modalPresentationStyle = .fullScreen
            self.present(tbc, animated: false, completion: nil)
        }
    }
    
}
