//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 06.03.2024.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        view.backgroundColor = .white
        let navigateButton = UIBarButtonItem(image:UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(buttonPressed))
        self.navigationItem.rightBarButtonItem = navigateButton
    }
    
    @objc func buttonPressed() {
    }
    
    
}
