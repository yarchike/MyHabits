//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 06.03.2024.
//

import UIKit

class ProgressCollectionViewCell:UICollectionViewCell{
    
    let contanerView: UIView = {
        let contanerView = UIView()
        contanerView.backgroundColor = .white
        contanerView.layer.cornerRadius = 5
        contanerView.translatesAutoresizingMaskIntoConstraints = false
        return contanerView
    }()
    
    
    let nameLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "Всё поулчиться!"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .systemGray
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    let percentLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "0 %"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .systemGray
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
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
        contanerView.addSubview(progressView)
        contanerView.addSubview(nameLabelView)
        contentView.addSubview(percentLabelView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            contanerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contanerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contanerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contanerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            nameLabelView.topAnchor.constraint(equalTo: contanerView.topAnchor, constant: 10),
            nameLabelView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 12),
            
            percentLabelView.topAnchor.constraint(equalTo: contanerView.topAnchor, constant: 10),
            percentLabelView.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor, constant: -12),
            
            progressView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor, constant: -12),
            progressView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 10),
        
            
        ])
    }
    func setup(
        progress: Float
    ) {
        let newProgress:Float = 0.4
        progressView.progress = newProgress
        percentLabelView.text = "\(newProgress * 100) %"
        
    }
    
    
    
    
    
    
}
