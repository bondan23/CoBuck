//
//  ViewController.swift
//  CoBuck
//
//  Created by Bondan Eko Prasetyo on 27/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import DepsObjC
import DepsMix
import IGListKit

class ViewController: UIViewController, ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return ["1" as ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    lazy var adapter: ListAdapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    internal lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .green
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        view.showsHorizontalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 24.0, right: 16.0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//        label.text = "Hello World"
//
//        self.view.addSubview(label)
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
//        let test = LibAClass()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            guard let self = self else {
//                return
//            }
//
//            let bomb = Bomb()
//            let text = bomb.explode()
//
//            let person = Person(name: text!, age: 26)
//
//            test.method { [weak self] (status) in
//                if !status {
//                    label.text = "Hello, \(person.name)"
//                    self?.view.backgroundColor = .red
//                }
//            }
//        }
    }


}
