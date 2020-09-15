//
//  DetailViewController.swift
//  Country Flag
//
//  Created by Rohit Jangid on 15/07/20.
//  Copyright © 2020 Rohit Jangid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var flagImage: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        flagImage.layer.borderWidth = 1
        flagImage.layer.borderColor = UIColor.lightGray.cgColor
        
        if let imageToLoad = selectedImage {
            flagImage.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped(){
        guard let image = flagImage.image?.pngData() else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage ?? "Country flag"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
