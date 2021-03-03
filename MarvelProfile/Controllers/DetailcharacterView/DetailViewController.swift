//
//  DetailViewController.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var getImage: URL?
    var getName: String?
    var getDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupImage()
       
    }
    
    func setupLabel() {
        if getDescription! == "" {
            lblDescription.text = "No contiene descripción"
            lblDescription.textColor = UIColor.gray
            lblName.text = getName
            lblDescription.numberOfLines = 0
            lblDescription.lineBreakMode = .byWordWrapping
            lblDescription.sizeToFit()
        } else {
            lblName.text = getName
            lblName.textColor = UIColor.white
            lblDescription.text = getDescription
            lblDescription.textColor = UIColor.white
            lblDescription.numberOfLines = 0
            lblDescription.lineBreakMode = .byWordWrapping
            lblDescription.sizeToFit()
        }
       
    }
    
    func setupImage() {
        let imgData = "\(getImage!)" + "/portrait_xlarge.jpg"
        let url = URL(string: imgData)
    
        if (url == nil || imgData.contains("image_not_available"))  {
            imgCharacter.image = UIImage(named: "ImageNotAvailable2")
            imgCharacter.contentMode = .scaleAspectFill
        } else {
            imgCharacter.image = UIImage(url: URL(string: imgData))
            imgCharacter.contentMode = .scaleAspectFill
           
        }
    }
    


}
