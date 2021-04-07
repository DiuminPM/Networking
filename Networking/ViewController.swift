//
//  ViewController.swift
//  Networking
//
//  Created by DiuminPM on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var image = UIImageView()
    let tapButton = UIButton()
    let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialized()
        
        // Do any additional setup after loading the view.
    }
    private func initialized() {
        view.backgroundColor = .gray
        image.frame = view.bounds
        image.isHidden = true
        view.addSubview(image)
        tapButton.isHidden = false
        tapButton.addTarget(self, action: #selector(fetchedImage), for: .touchUpInside)
        tapButton.frame = CGRect(x: 16, y: view.frame.height/2 - 150, width: view.frame.width - 32, height: 300)
        tapButton.layer.borderWidth = 1
        tapButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tapButton.layer.cornerRadius = 10
        tapButton.titleLabel?.font = .systemFont(ofSize: 46)
        tapButton.titleLabel?.numberOfLines = 0
        tapButton.titleLabel?.textAlignment = .center
        view.addSubview(tapButton)
        tapButton.setTitle("Tap to download an Image", for: .normal)
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame = CGRect(x: view.frame.width/2 - 25, y: view.frame.height/2 - 25, width: 50, height: 50)
        activityIndicator.color = .blue
        activityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        view.addSubview(activityIndicator)
    }
    @objc func fetchedImage() {
        image.isHidden = false
        tapButton.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.image.image = image
                }
            }
        }.resume()
    }


}

