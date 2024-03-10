//
//  HabitCollectionViewHeader.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 10.03.2024.
//

import UIKit

class HabitCollectionViewHeader: UICollectionReusableView {
    
    static let identifier = "HabitCollectionViewHeader"
    
    let title: UILabel = {
        let labelView = UILabel()
        labelView.text = "Сегодня"
        labelView.font = UIFont.boldSystemFont(ofSize: 17)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
    }
    
    private func setupConstraints(){
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
       
        
    }
    
}
