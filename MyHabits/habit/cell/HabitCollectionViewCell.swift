//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 06.03.2024.
//

import UIKit

class HabitCollectionViewCell:UICollectionViewCell{
    
    let contanerView: UIView = {
        let contanerView = UIView()
        contanerView.backgroundColor = .white
        contanerView.layer.cornerRadius = 5
        contanerView.translatesAutoresizingMaskIntoConstraints = false
        return contanerView
    }()
    
    
    let nameLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "Выпить стакан воды"
        labelView.font = UIFont.boldSystemFont(ofSize: 17)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    let timeLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "Каждый день"
        labelView.font = UIFont.boldSystemFont(ofSize: 12)
        labelView.textColor = .systemGray2
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    
    let counterLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "Счетчик"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .systemGray
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayouts()
    }
    private func setupView() {
        contentView.backgroundColor = UIColor(named: "light_gray")

    }
    
    private func setupSubviews() {
        contentView.addSubview(contanerView)
        contanerView.addSubview(nameLabelView)
        contanerView.addSubview(timeLabelView)
        contanerView.addSubview(counterLabelView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            contanerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contanerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contanerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contanerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            nameLabelView.topAnchor.constraint(equalTo: contanerView.topAnchor, constant: 20),
            nameLabelView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 20),
            
            timeLabelView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 8),
            timeLabelView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 20),
            
            counterLabelView.topAnchor.constraint(equalTo: timeLabelView.bottomAnchor, constant: 30),
            counterLabelView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 20),
            
            
            
            
            
         
        
            
        ])
    }
    func setup(
        habit: Habit
    ) {
        nameLabelView.text = "Bla bla bla"
        nameLabelView.textColor = habit.color
        timeLabelView.text = habit.dateString
        counterLabelView.text = "0"
        
    }
    
    
    
}
