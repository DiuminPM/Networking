//
//  CustomViewCell.swift
//  Networking
//
//  Created by DiuminPM on 07.04.2021.
//

import Foundation
import SnapKit

class CustomViewCell: UITableViewCell {
    
    var logoCourse = UIImageView()
    var courseName = UILabel()
    var numberLesson = UILabel()
    var numberTest = UILabel()
    static let indentifire = "CustomViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        contentView.addSubview(logoCourse)
        logoCourse.layer.cornerRadius = 10
        logoCourse.layer.borderWidth = 2
        logoCourse.clipsToBounds = true
        logoCourse.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview().inset(8)
            maker.left.equalToSuperview().inset(5)
            maker.width.equalTo(100)
        }
        contentView.addSubview(courseName)
        courseName.numberOfLines = 0
        courseName.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(116)
            maker.right.top.equalToSuperview().inset(8)
        }
        contentView.addSubview(numberLesson)
        numberLesson.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(116)
            maker.right.equalToSuperview().inset(16)
            maker.top.equalTo(courseName.snp.bottom).offset(5)
        }
        contentView.addSubview(numberTest)
        numberTest.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(116)
            maker.right.equalToSuperview().inset(16)
            maker.top.equalTo(numberLesson.snp.bottom).offset(5)
        }
    }
}
