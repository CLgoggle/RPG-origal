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
    
    var bukiArray: [String] = [
        "tsurugi_bronze_sabi_red","tsurugi_bronze_red","sword_shortsword_brown","sword_longsword_monochrome","sword_longsword_brown"
    ]
    var nameArray: [String] = [
        "錆びたブロンズソード","ブロンズソード","ショートソード","ロングソード","ブロンズロングソード"
    ]
    
    var bukiattack: [Int] = [
    1,3,2,4,5]
    
    var nanidoArray: [String] = ["名のとおり錆びている剣。他の剣より攻撃力が低い",
                                 "一般的な長さの剣",
                                 "一般的なものより短い剣",
                                 "一般的なものより長く、輝かしい剣",
                                 "一般的なものより長い剣"]
    
    var index: Int = 0
    
        


    override func viewDidLoad() {
        super.viewDidLoad()
setUI()
        // Do any additional setup after loading the view.
    }
    
   
    
    func setUI() {
        imageView.image = UIImage(named: bukiArray[index])
        nameLabel.text = nameArray[index]
        nanidoLabel.text = nanidoArray[index]
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
