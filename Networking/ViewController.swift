//
//  ViewController.swift
//  Networking
//
//  Created by DiuminPM on 06.04.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tapButton = UIButton()
    let tapGetButton = UIButton()
    let tapPostButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialized()
        setupNavigationBar()
        
        // Do any additional setup after loading the view.
    }
    private func initialized() {
        view.backgroundColor = .gray
        tapButton.addTarget(self, action: #selector(fetchedImage), for: .touchUpInside)
        view.addSubview(tapButton)
        tapButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        tapButton.layer.borderWidth = 1
        tapButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tapButton.layer.cornerRadius = 10
        tapButton.titleLabel?.font = .systemFont(ofSize: 46)
        tapButton.titleLabel?.numberOfLines = 0
        tapButton.titleLabel?.textAlignment = .center
        view.addSubview(tapButton)
        tapButton.setTitle("Tap to download an Image", for: .normal)
        tapButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).inset(150)
            maker.right.left.equalTo(view).inset(16)
            maker.height.equalTo(150)
        }
        tapGetButton.addTarget(self, action: #selector(getRequest), for: .touchUpInside)
        view.addSubview(tapGetButton)
        tapGetButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        tapGetButton.layer.borderWidth = 1
        tapGetButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tapGetButton.layer.cornerRadius = 10
        tapGetButton.titleLabel?.font = .systemFont(ofSize: 46)
        tapGetButton.titleLabel?.numberOfLines = 0
        tapGetButton.titleLabel?.textAlignment = .center
        view.addSubview(tapGetButton)
        tapGetButton.setTitle("GET", for: .normal)
        tapGetButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(tapButton.snp.bottom).inset(-16)
            maker.right.left.equalTo(view).inset(16)
            maker.height.equalTo(150)
        }
        tapPostButton.addTarget(self, action: #selector(postRequest), for: .touchUpInside)
        view.addSubview(tapPostButton)
        tapPostButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        tapPostButton.layer.borderWidth = 1
        tapPostButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tapPostButton.layer.cornerRadius = 10
        tapPostButton.titleLabel?.font = .systemFont(ofSize: 46)
        tapPostButton.titleLabel?.numberOfLines = 0
        tapPostButton.titleLabel?.textAlignment = .center
        view.addSubview(tapPostButton)
        tapPostButton.setTitle("POST", for: .normal)
        tapPostButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(tapGetButton.snp.bottom).inset(-16)
            maker.right.left.equalTo(view).inset(16)
            maker.height.equalTo(150)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Controller"
    }
    
    @objc func fetchedImage() {
        navigationController?.pushViewController(ImageViewController(), animated: true)
    }
    
    @objc func getRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response,
            let data = data else { return }
            print(response)
            print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch {
                print(error)
            }
        } .resume()
    }
    @objc func postRequest() {
        
    }
    


}

