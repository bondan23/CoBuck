//
//  ViewController.swift
//  CoBuck
//
//  Created by Bondan Eko Prasetyo on 27/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import DepsObjC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "Hello World"
        
        self.view.addSubview(label)
        
        let test = LibAClass()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else {
                return
            }
            
            test.method { [weak self] (status) in
                self?.view.backgroundColor = .red
            }
        }
        // Do any additional setup after loading the view.
    }


}

