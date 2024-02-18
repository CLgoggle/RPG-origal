//
//  shopViewController.swift
//  RPG
//
//  Created by goggle CL on 2024/02/04.
//

import UIKit

class shopViewController: UIViewController {
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var setumeiLabel:UILabel!
    @IBOutlet var nedanLabel:UILabel!
    @IBOutlet var MoneyLabel:UILabel!

    let defaults = UserDefaults.standard
    var index: Int = 0
    
    var Money = UserDefaults.standard.integer(forKey: "Money")
    
    

    
    var bukiArray: [String] = [
        "tsurugi_bronze_sabi_red","tsurugi_bronze_red","sword_shortsword_brown","sword_longsword_monochrome","sword_longsword_brown"
    ]
    var nameArray: [String] = [
        "錆びたブロンズソード","ブロンズソード","ショートソード","ロングソード","ブロンズロングソード"
    ]
    
    var bukiattack: [Int] = [
    1,3,2,4,5]
   
    
    var nedansutiArray: [Int] = [100,100,200,100,100]
    var nedanArray: [String] = ["100円","100円","200円","100円","100円"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        MoneyLabel.text = "\(Money)円"

        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        imageView.image = UIImage(named: bukiArray[index])
        nameLabel.text = nameArray[index]
        nedanLabel.text = nedanArray[index]
    }
    
    @IBAction func next(){
        if index == bukiArray.count - 1 {
            index = 0
        }else {
            index += 1
        }
        setUI()
        
    }
    
    @IBAction func back(){
        if index == 0 {
            index = bukiArray.count - 1
        }else {
            
            index -= 1
        }
        setUI()
    }
    
    @IBAction func close(){
        if Money >= nedansutiArray[index]{
            Money -= nedansutiArray[index]
        }
        let Value = bukiArray[index]
        defaults.set(Money, forKey: "Money")
        UserDefaults.standard.set(Value, forKey: "buki")
        MoneyLabel.text = "\(Money)円"
        let Value2 = bukiattack[index]
        UserDefaults.standard.set(Value2, forKey: "bukiattack")
        if let savedValue = UserDefaults.standard.string(forKey: "buki"){
            print(savedValue)
        }
    }
    
    
    
    @IBAction func close2(){
        let Value = bukiArray[index]
        UserDefaults.standard.set(Value, forKey: "buki")
        let Value2 = bukiattack[index]
        UserDefaults.standard.set(Value2, forKey: "bukiattack")
        if let savedValue = UserDefaults.standard.string(forKey: "buki"){
            print(savedValue)
            
        }else {
            print("見つかりません")
        }
        dismiss(animated: true)
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
