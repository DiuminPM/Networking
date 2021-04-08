//
//  CourseViewController.swift
//  Networking
//
//  Created by DiuminPM on 07.04.2021.
//

import UIKit

class CourseViewController: UIViewController {
    private var courses = [Course]()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createdTableView()
        fetchData()

    }
    func createdTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.indentifire)
    }
    func fetchData() {
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
//        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"

        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error{
                print("error serialization json", error)
            }
        } .resume()
    }
    

}

extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomViewCell.indentifire, for: indexPath) as! CustomViewCell
        configureCell(cell: cell, for: indexPath)
        
        return cell
    }
    
    private func configureCell(cell: CustomViewCell, for indexPath: IndexPath ) {
        let course = courses[indexPath.row]
        cell.courseName.text = course.name
        if let numberOfLesson = course.number_of_lessons {
            cell.numberLesson.text = "Number of lesson: \(numberOfLesson)"
        }
        if let numberOfTest = course.number_of_tests {
            cell.numberTest.text = "Number of test: \(numberOfTest)"
        }
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                cell.logoCourse.image = UIImage(data: imageData)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
}
