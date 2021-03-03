//
//  ExtCharactersViewController.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 2/3/21.
//

import Foundation
import UIKit


extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCharacters") as! CellCellCharactersViewController
        let marvelHero = viewModel.characterData[indexPath.row]
        
        cell.selectionStyle = .none
        cell.nameCharacters.text = marvelHero.name
        cell.nameCharacters.textColor = UIColor.white
        
        let imgData = "\(marvelHero.image!)" + "/portrait_xlarge.jpg"
        let url = URL(string: imgData)
    
        if (url == nil || imgData.contains("image_not_available"))  {
            cell.imgChracters?.image = UIImage(named: "ImageNotAvailable2")
            cell.imgChracters?.contentMode = .scaleAspectFill
        } else {
            cell.imgChracters?.image = UIImage(url: URL(string: imgData))
            cell.imgChracters?.contentMode = .scaleAspectFill
            print("imgData",imgData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let marvelHero = viewModel.characterData[indexPath.row]
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.getName = marvelHero.name!
        controller.getDescription = marvelHero.description!
        controller.getImage = marvelHero.image!
        self.navigationController!.pushViewController(controller, animated: true)
        
    }
  
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.viewModel.characterData.count - 1
                if !isLoading && indexPath.row == lastElement {
                    
                    print("HALAR ELEMEMTOS")
                    activity.startAnimating()
                    activity.isHidden = false
                    ApiURL.page += 1
                 
                
                    }
            }
    

    
}
