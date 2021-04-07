//
//  CourseViewController.swift
//  Networking
//
//  Created by DiuminPM on 07.04.2021.
//

import UIKit

class CourseViewController: UIViewController {
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createdTableView()
        fetchData()

    }
    func createdTableView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    func fetchData() {
//        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"

        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print("\(websiteDescription.websiteName) \(websiteDescription.websiteDescription)")
            } catch let error{
                print("error serialization json", error)
            }
        } .resume()
    }
    

}
