//
//  ImageViewController.swift
//  Networking
//
//  Created by DiuminPM on 07.04.2021.
//

import UIKit

class ImageViewController: UIViewController {
    var image = UIImageView()
    let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        image.frame = view.bounds
        view.addSubview(image)
        fetchedImage()

    }
    
    func fetchedImage() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame = CGRect(x: view.frame.width/2 - 25, y: view.frame.height/2 - 25, width: 50, height: 50)
        activityIndicator.color = .blue
        activityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        view.addSubview(activityIndicator)
        
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
