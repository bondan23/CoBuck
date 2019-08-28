//
//  ViewController.swift
//  CoBuck
//
//  Created by Bondan Eko Prasetyo on 27/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit
import DepsMix
import DepsObjC
import PINRemoteImage_Buck
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "Hello World"
        
        self.view.addSubview(label)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        imageView.pin_setImage(from: URL(string: "https://via.placeholder.com/100")!)
        self.view.addSubview(imageView)
        
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        self.view.addSubview(node.view)
        node.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            node.view.heightAnchor.constraint(equalToConstant: 100),
            node.view.widthAnchor.constraint(equalToConstant: 100),
            node.view.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
        
        let test = LibAClass()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else {
                return
            }
            
            let bomb = Bomb()
            let text = bomb.explode()
            
            let person = Person(name: text!, age: 26)
            
            test.method { [weak self] status in
                if !status {
                    label.text = "Hello, \(person.name)"
                    self?.view.backgroundColor = .red
                }
            }
        }
    }
}
