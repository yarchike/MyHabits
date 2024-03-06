//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 06.03.2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        label.text = "Привычка за 21 день"
        return label
    }()
    
    let contantTextView: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = .white
        labelView.numberOfLines = 0
        labelView.textColor = .black
        labelView.font.withSize(17)
        labelView.text =
        """
        Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:
        
        1. Провести 1 день без обращения
        к старым привычкам, стараться вести себя так, как будто цель, загаданная
        в перспективу, находится на расстоянии шага.
        
        2. Выдержать 2 дня в прежнем состоянии самоконтроля.
        
        3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,
        с чем еще предстоит серьезно бороться.
        
        4. Поздравить себя с прохождением первого серьезного порога в 21 день.
        За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.
        
        5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.
        """
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
        setupContentOfScrollView()
    }
    
    func setupView(){
        view.backgroundColor = .white
        title = "Информация"
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func setupContentOfScrollView() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(contantTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contantTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            contantTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contantTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contantTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
        
        
    }
}
