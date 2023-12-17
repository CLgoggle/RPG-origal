//
//  LobbyViewController.swift
//  RPG
//
//  Created by goggle CL on 2023/04/30.
//

import UIKit

class LobbyViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var attackLabel: UILabel!
    @IBOutlet var bouguLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TechMonManager.playBGM(fileName: "lobby")
        if let savedValue = UserDefaults.standard.string(forKey: "buki"){
            imageView.image = UIImage(named:savedValue)
        }
        if let savedValue = UserDefaults.standard.string(forKey: "bougu"){
            imageView2.image = UIImage(named:savedValue)
        }
        let savedValue2 = UserDefaults.standard.integer(forKey: "bukiattack")
        attackLabel.text = "攻撃力" + String(20) + "+" + String(savedValue2)
        let savedValue3 = UserDefaults.standard.integer(forKey: "bougusuti")
        bouguLabel.text = "防御力" + String(0) + "+" + String(savedValue3)
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TechMonManager.stopBGM()
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
