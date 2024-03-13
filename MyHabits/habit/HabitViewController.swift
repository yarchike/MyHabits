//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Ярослав  Мартынов on 06.03.2024.
//

import UIKit

class HabitViewController: UIViewController {
    
    private var name = ""
    private var color = UIColor.orange
    private var date = Date()
    
    let nameLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "НАЗВАНИЕ"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    lazy var nameView: UITextField = {
        let textField = UITextField()
        textField.clipsToBounds = true
        textField.keyboardType = UIKeyboardType.default
        textField.font = UIFont.boldSystemFont(ofSize: 17.0)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(nameTextChanged(_:)), for: .editingChanged)
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    let colorLabeView: UILabel = {
        let labelView = UILabel()
        labelView.text = "ЦВЕТ"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    lazy var colorView: UIView = {
        let colorView = UIView()
        colorView.layer.cornerRadius = 15
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .orange
        colorView.clipsToBounds = true
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(tapColor)
        )
        colorView.addGestureRecognizer(tap)
        
        return colorView
    }()
    
    let timeLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "ВРЕМЯ"
        labelView.font = UIFont.boldSystemFont(ofSize: 13)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    let everyDay: UILabel = {
        let labelView = UILabel()
        labelView.text = "Каждый день в "
        labelView.font = labelView.font.withSize(17)
        labelView.textColor = .black
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    let inputTimeLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "11:00 PM"
        labelView.font = labelView.font.withSize(17)
        labelView.textColor = UIColor(named: "AccentColor")
        labelView.numberOfLines = 1
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private lazy var timePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle  = .wheels
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        title = "Создать"
        view.backgroundColor = .white
        let rightNavigateButton = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(rightButtonPressed))
        let leftNavigateButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(leftButtonPressed))
        self.navigationItem.rightBarButtonItem = rightNavigateButton
        self.navigationItem.leftBarButtonItem = leftNavigateButton
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        inputTimeLabel.text = timeFormatter.string(from: timePickerView.date)
    }
    
    private func addSubviews() {
        view.addSubview(nameLabelView)
        view.addSubview(nameView)
        view.addSubview(colorLabeView)
        view.addSubview(colorView)
        view.addSubview(everyDay)
        view.addSubview(inputTimeLabel)
        view.addSubview(timePickerView)
        
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            nameLabelView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            nameLabelView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            nameLabelView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 16),
            
            nameView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 8),
            nameView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            nameView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 16),
            
            colorLabeView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 16),
            colorLabeView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            colorLabeView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 16),
            
            colorView.topAnchor.constraint(equalTo: colorLabeView.bottomAnchor, constant: 8),
            colorView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            colorView.widthAnchor.constraint(equalToConstant: 30),
            colorView.heightAnchor.constraint(equalToConstant: 30),
            
            everyDay.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 8),
            everyDay.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            
            inputTimeLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 8),
            inputTimeLabel.leadingAnchor.constraint(equalTo: everyDay.trailingAnchor),
            
            timePickerView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            timePickerView.topAnchor.constraint(equalTo: everyDay.bottomAnchor, constant: 16)
            
        ])
    }
    
    
    @objc func rightButtonPressed() {
        let newHabit = Habit(name: name,
                             date:date,
                             color: self.color)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func leftButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func  nameTextChanged(_ textField: UITextField){
        if let text = textField.text {
            name = text
        }
    }
    
    @objc private func tapColor(gesture: UIGestureRecognizer) {
        presentColorPicker()
    }
    
    @objc func handleDatePicker(_ datePicker: UIDatePicker) {
        date =  datePicker.date
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        inputTimeLabel.text = timeFormatter.string(from: datePicker.date)
    }
    

    
    func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Background Color"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        self.present(colorPicker, animated: true)
    }
    
    
}

extension HabitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.color = viewController.selectedColor
        self.colorView.backgroundColor = viewController.selectedColor
        
    }
    
    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.color = viewController.selectedColor
        self.colorView.backgroundColor = viewController.selectedColor
    }
}
