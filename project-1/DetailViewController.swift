//
//  DetailViewController.swift
//  project-1
//
//  Created by Bruno Guirra on 31/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var pictureIndex: Int?
    var amountOfPictures: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pictureIndex = pictureIndex, let amountOfPictures = amountOfPictures {
            title = "Picture \(pictureIndex) of \(amountOfPictures)"
        }
        navigationItem.largeTitleDisplayMode = .never
        
        // Add an action button the navigation bar,
        // the type action is to indicate the appearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("picture not found.")
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [selectedImage ?? "", image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
