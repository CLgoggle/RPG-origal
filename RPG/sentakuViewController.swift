//
//  sentakuViewController.swift
//  RPG
//
//  Created by goggle CL on 2023/07/02.
//

import UIKit

class sentakuViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var animalArray: [Enemy] = [
    enemy,raizin,mahotukai,yaritukai,mazin,rich
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(){
        
    }
    
    @IBAction func back(){
        
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
