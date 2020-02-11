//
//  QuestionViewController.swift
//  QuickQuiz
//
//  Created by Hoang Tung on 2/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
  var questions: [Question]?
  var displayedIndex: Int = 0
  
  let questionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hello"
    label.textColor = .white
    label.font = .systemFont(ofSize: 24)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()

  let resultButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Kết quả", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemPink
    button.layer.cornerRadius = 8
    return button
  }()

  let answerTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .systemIndigo
    tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: "tableCell")
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemIndigo
    setupView()
    setupLabel()
    setupLayout()
    setupCollectionView()
    displayResultButton()
    addAction()
  }
  
  func setupView() {
    view.addSubview(questionLabel)
    view.addSubview(answerTableView)
    view.addSubview(resultButton)
  }
  
  func setupLayout() {
    questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    answerTableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 32).isActive = true
    answerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
    answerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
    answerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    
    resultButton.topAnchor.constraint(equalTo: answerTableView.bottomAnchor, constant: 32).isActive = true
    resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    resultButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    resultButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  func setupLabel() {
    questionLabel.text = questions![displayedIndex].question
  }
  
  func setupCollectionView() {
    self.answerTableView.delegate = self
    self.answerTableView.dataSource = self
  }
  
  func displayResultButton() {
    if displayedIndex == questions!.count - 1 {
      resultButton.isHidden = false
    } else {
      resultButton.isHidden = true
    }
  }
  
  func addAction() {
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(nextQuestion))
    rightSwipe.direction = .left
    view.addGestureRecognizer(rightSwipe)
    
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(previousQuestion))
    leftSwipe.direction = .right
    view.addGestureRecognizer(leftSwipe)
    
    resultButton.addTarget(self, action: #selector(navigateToResultScene), for: .touchUpInside)
  }
  
  @objc func nextQuestion() {
    if displayedIndex < questions!.count - 1 {
      displayedIndex += 1
      answerTableView.reloadData()
      setupLabel()
      
    }
    displayResultButton()
  }
  
  @objc func previousQuestion() {
    if displayedIndex > 0 {
      displayedIndex -= 1
      answerTableView.reloadData()
      setupLabel()
    }
    displayResultButton()
  }
  
  @objc func navigateToResultScene() {
    let destinationVC = ResultViewController()
    destinationVC.questions = questions
    navigationController?.pushViewController(destinationVC, animated: true)
  }
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questions![displayedIndex].answers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! AnswerTableViewCell
    cell.answerLabel.text = questions![displayedIndex].answers[indexPath.row].answer
    cell.state = questions![displayedIndex].answers[indexPath.row].isSelected
    let backgroundView = UIView()
    cell.selectedBackgroundView = backgroundView
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let state = questions![displayedIndex].answers[indexPath.row].isSelected
    questions![displayedIndex].answers[indexPath.row].isSelected = !state
    answerTableView.reloadData()
  }
}
