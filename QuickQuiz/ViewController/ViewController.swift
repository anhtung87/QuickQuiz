//
//  ViewController.swift
//  QuickQuiz
//
//  Created by Hoang Tung on 2/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var quiz = test
  
  let QuizNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "TRẮC NGHIỆM"
    label.textColor = .white
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()
  
  let topicCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .clear
    collectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
    setupLayout()
    setupCollectionView()
    setupNavigation()
  }
  
  func setupView() {
    view.backgroundColor = .systemIndigo
    view.addSubview(QuizNameLabel)
    view.addSubview(topicCollectionView)
  }
  
  func setupLayout() {
    QuizNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    QuizNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    QuizNameLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1).isActive = true
    QuizNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    
    topicCollectionView.topAnchor.constraint(equalTo: QuizNameLabel.bottomAnchor, constant: 32).isActive = true
    topicCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    topicCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    topicCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.tintColor = .white
  }
  
  func setupCollectionView() {
    topicCollectionView.delegate = self
    topicCollectionView.dataSource = self
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return quiz.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopicCollectionViewCell
    cell.topicLabel.text = quiz[indexPath.row].subject
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let radius = UIScreen.main.bounds.maxX
    return CGSize(width: radius / 2 - 24, height: radius / 2 - 24)
  }
  
  // function trả về khoảng cách giữa 2 hàng
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 16
  }
  
  // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let destinationVC = QuestionViewController()
    destinationVC.questions = quiz[indexPath.row].questions
    navigationController?.pushViewController(destinationVC, animated: true)
    navigationItem.backBarButtonItem?.tintColor = .white
  }
}

