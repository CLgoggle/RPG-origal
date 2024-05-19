//
//  bukisentakuViewController.swift
//  RPG
//
//  Created by goggle CL on 2023/08/27.
//

import UIKit

class bukisentakuViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nanidoLabel: UILabel!
    
    var bukiArray: [String] = ItemStorage.bukiArray
    var bukiNameArray: [String] = ItemStorage.bukiNameArray
    
    var bukiAttackArray: [Int] = ItemStorage.bukiAttackArray
    
    var bukiKaisetuArray: [String] = ItemStorage.bukiKaisetuArray
    
    var index: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bukiArray = ItemStorage.showMyBuki(bukiArray)
        bukiNameArray = ItemStorage.showMyBuki(bukiNameArray)
        bukiAttackArray = ItemStorage.showMyBuki(bukiAttackArray)
        setUI()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUI() {
        imageView.image = UIImage(named: bukiArray[index])
        nameLabel.text = bukiNameArray[index]
        nanidoLabel.text = bukiKaisetuArray[index]
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
        let Value = bukiArray[index]
        UserDefaults.standard.set(Value, forKey: "buki")
        let Value2 = bukiAttackArray[index]
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
