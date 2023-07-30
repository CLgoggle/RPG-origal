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
    
    var index: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        TechMonManager.playBGM(fileName: "sentaku_BGM")
        // Do any additional setup after loading the view.
        setUI()
    }
    
    @IBAction func next(){
        if index == animalArray.count - 1 {
            index = 0
        }else {
            index += 1
        }
        setUI()
        
    }
    
    @IBAction func back(){
        if index == 0 {
            index = animalArray.count - 1
        }else {
            
            index -= 1
        }
        setUI()
    }
    
    func setUI() {
        imageView.image = animalArray[index].image
        nameLabel.text = animalArray[index].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let nextView = segue.destination as! BattleViewController
            nextView.enemy = animalArray[index]
            animalArray = [enemy,raizin,mahotukai,yaritukai,mazin,rich]
        }
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
