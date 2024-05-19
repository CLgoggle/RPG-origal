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
    @IBOutlet var buybutton:UIButton!
    
    
    let defaults = UserDefaults.standard
    var index: Int = 0
    
    var Money = UserDefaults.standard.integer(forKey: "Money")
    
    
    
    
    var bukiArray: [String] = ItemStorage.bukiArray
    var bukiNameArray: [String] = ItemStorage.bukiNameArray
    
    var bukiAttackArray: [Int] = ItemStorage.bukiAttackArray
    
    
    var bukiPriceArray: [Int] = ItemStorage.bukiPriceArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bukiArray = ItemStorage.showNewBuki(bukiArray)
        bukiNameArray = ItemStorage.showNewBuki(bukiNameArray)
        bukiAttackArray = ItemStorage.showNewBuki(bukiAttackArray)
        bukiPriceArray = ItemStorage.showNewBuki(bukiPriceArray)
        setUI()
        
        MoneyLabel.text = "所持金:" + "\(Money)円"
        
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        imageView.image = UIImage(named: bukiArray[index])
        nameLabel.text = bukiNameArray[index]
        nedanLabel.text = "値段:" + String(bukiPriceArray[index]) + "円"
        // 所持金が足りなかったらbuttonを押せなくする
        if Money <= bukiPriceArray[index]{
            buybutton.isEnabled = false
        }
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
    
    @IBAction func buy(){
        if Money >= bukiPriceArray[index]{
            Money -= bukiPriceArray[index]
        }
        let Value = bukiArray[index]
        defaults.set(Money, forKey: "Money")
        UserDefaults.standard.set(Value, forKey: "buki")
        MoneyLabel.text = "所持金:\(Money)円"
        let Value2 = bukiAttackArray[index]
        UserDefaults.standard.set(Value2, forKey: "bukiattack")
        if let savedValue = UserDefaults.standard.string(forKey: "buki"){
            print(savedValue)
        }
        
        if let buyItemIndex = ItemStorage.bukiArray.firstIndex(of: bukiArray[index]){
            ItemStorage.myBuki[buyItemIndex] = 1
        }else {
            print("購入できませんでした")
        }
        setUI()
    }
    
    
    
    @IBAction func close2(){
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
