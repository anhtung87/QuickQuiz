//
//  Fake.swift
//  QuickQuiz
//
//  Created by Hoang Tung on 2/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation

let test: [Test] = [
  Test(subject: "Toán học", questions: [
    Question(question: "13 + 29 = ?", answers: [
      Answer(answer: "41", isSelected: false),
      Answer(answer: "42", isSelected: false),
      Answer(answer: "43", isSelected: false),
      Answer(answer: "44", isSelected: false)
    ], rightAnswer: 1),
    Question(question: "87 - 29 = ?", answers: [
      Answer(answer: "56", isSelected: false),
      Answer(answer: "57", isSelected: false),
      Answer(answer: "58", isSelected: false),
      Answer(answer: "59", isSelected: false)
    ], rightAnswer: 2),
    Question(question: "6 x 13 = ?", answers: [
      Answer(answer: "65", isSelected: false),
      Answer(answer: "66", isSelected: false),
      Answer(answer: "77", isSelected: false),
      Answer(answer: "78", isSelected: false)
    ], rightAnswer: 3)
  ]),
  Test(subject: "Văn học", questions: [
    Question(question: "Em bé nằm trong bụng mẹ gọi là gì?", answers: [
      Answer(answer: "bào thai ( thai nhi)", isSelected: false),
      Answer(answer: "Đồng bào", isSelected: false),
      Answer(answer: "Nhau thai", isSelected: false),
      Answer(answer: "Bào trứng", isSelected: false)
    ], rightAnswer: 0),
    Question(question: "Trong câu thơ sau đâu là động từ: \" Nắng ghé vào cửa sổ \"?", answers: [
      Answer(answer: "Ghé", isSelected: false),
      Answer(answer: "Vào", isSelected: false),
      Answer(answer: "Nắng", isSelected: false),
      Answer(answer: "Cửa sổ", isSelected: false)
    ], rightAnswer: 0),
    Question(question: "Tìm từ không cùng nhóm trong các từ sau:", answers: [
      Answer(answer: "Thanh bình", isSelected: false),
      Answer(answer: "Bình yên", isSelected: false),
      Answer(answer: "Bình thản", isSelected: false),
      Answer(answer: "Thái bình", isSelected: false)
    ], rightAnswer: 2)
  ]),
  Test(subject: "Lịch sử", questions: [
    Question(question: "Phong trào kháng chiến chống Pháp lớn nhất ở Nam Kì khi Pháp xâm lược nước ta do ai lãnh đạo?", answers: [
      Answer(answer: "Nguyễn Trung Trực", isSelected: false),
      Answer(answer: "Trương Định", isSelected: false),
      Answer(answer: "Nguyễn Hữu Huân", isSelected: false),
      Answer(answer: "Hồ Xuân Nghiệp", isSelected: false)
    ], rightAnswer: 1),
    Question(question: "Bình Sơn ngày nay thuộc tỉnh:", answers: [
      Answer(answer: "Quảng Ngãi", isSelected: false),
      Answer(answer: "An Giang", isSelected: false),
      Answer(answer: "Long An", isSelected: false),
      Answer(answer: "Quảng Nam", isSelected: false)
    ], rightAnswer: 0),
    Question(question: "Vào những năm cuối thế kỉ XIX, đầu thế kỉ XX, sau khi dập tắt phong trào đấu tranh vũ trang của nhân dân ta, thực dân Pháp đã:", answers: [
      Answer(answer: "Tập trung đầu tư phát triển kinh tế.", isSelected: false),
      Answer(answer: "Đẩy mạnh và phát triển hệ thống giáo dục trên cả nước.", isSelected: false),
      Answer(answer: "Đặt ách thống trị và tăng cường bóc lột, vơ vét tài nguyên của nước ta.", isSelected: false),
      Answer(answer: "Từ bỏ dã tâm xâm lược nước ta, chuyển giao chính quyền cho triều đình Huế.", isSelected: false)
    ], rightAnswer: 2)
  ]),
]
