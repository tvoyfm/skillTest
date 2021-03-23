//
//  TaskTableViewCell.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

protocol TaskTableViewCellProtocol: class {
    func updateHeightOfRow(_ cell: TaskTableViewCell, _ textView: UITextView)
}

class TaskTableViewCell: UITableViewCell {
// MARK: - Parameters
    private let UDPadding:      CGFloat = 5.0
    private let cornerRadius:   CGFloat = 20.0
    
// MARK: - Objects
    private let taskStorage          = TaskStorage.storage
    var deleteClosure: () -> Void = {}
    
    private let taskTextView = TaskTextView()
    weak var cellDelegate: TaskTableViewCellProtocol?
    
    var currentTask: Task? {
        didSet {
            updateForTask(task: currentTask!)
        }
    }
        
// MARK: - Config
    func configView(){
        func configToggle() {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(changeState(_:)))
            taskTextView.toggle.addGestureRecognizer(gesture)
        }
        
        func configTextView() {
            let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(deleteTask(_:)))
            taskTextView.textView.addGestureRecognizer(longGesture)
            
            taskTextView.textView.delegate = self
            selectionStyle = .none
        }
        
        // Call all methods
        configTextView()
        configToggle()
    }
    
// MARK: - Setup UI
    private func setupUI() {
        func setupTaskTextView() {
            addSubview(taskTextView)
            taskTextView.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                taskTextView.topAnchor.constraint(equalTo: topAnchor, constant: UDPadding),
                taskTextView.leftAnchor.constraint(equalTo: leftAnchor),
                taskTextView.rightAnchor.constraint(equalTo: rightAnchor),
                taskTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -UDPadding)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        // Call all methods
        setupTaskTextView()
    }
        
// MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
// MARK: - Update cell
    func changeName(_ newTitle: String) {
        currentTask = taskStorage.changeTitle(currentTask!, newTitle: newTitle)
    }
    
    func updateForTask(task: Task) {
        taskTextView.update(task: task)
    }
    
// MARK: Gesture functions
    @objc func changeState(_ gestureRecognizer: UITapGestureRecognizer) {
        currentTask = taskStorage.changeState(currentTask!)
    }
    
    @objc func deleteTask(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            deleteClosure()
        }
    }
}
// MARK: - UITextViewDelegate
extension TaskTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let deletate = cellDelegate {
            deletate.updateHeightOfRow(self, textView)
            changeName(textView.text)
        }
    }
}
