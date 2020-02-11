//
//  AnswerView.swift
//  QuickQuiz
//
//  Created by Hoang Tung on 2/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
  var state: Bool = false
  
  let answerLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hello"
    label.textColor = .white
    label.font = .systemFont(ofSize: 20)
    label.numberOfLines = 0
    return label
  }()
  
  let answerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "unchecked")
    return imageView
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    self.backgroundColor = .systemIndigo
    setupView()
    setupLayout()
    displayCheckBox()
  }
  
  func setupView() {
    self.addSubview(answerLabel)
    self.addSubview(answerImageView)
  }
  
  func setupLayout() {
    answerImageView.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.6).isActive = true
    answerImageView.widthAnchor.constraint(equalTo: answerImageView.heightAnchor, constant: 0).isActive = true
    answerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    answerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    
    answerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    answerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
    answerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    answerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
  }
  
  func displayCheckBox() {
    if state {
      answerImageView.image = UIImage(named: "checked")
    } else {
      answerImageView.image = UIImage(named: "unchecked")
    }
  }
}
