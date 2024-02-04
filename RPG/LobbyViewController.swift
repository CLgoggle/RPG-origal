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
    @IBOutlet weak var MoneyLabel: UILabel!
    @IBOutlet weak var enemyCountLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEnemyCountLabel()
        

        
        // Do any additional setup after loading the view.
    }
    
    func incrementEnemyCount() {
           var enemyCount = UserDefaults.standard.integer(forKey: "enemyCount")
           enemyCount += 1
        var Money = UserDefaults.standard.integer(forKey: "Money")
        Money += 1
    

           UserDefaults.standard.set(enemyCount, forKey: "enemyCount")
        UserDefaults.standard.set(Money, forKey: "Money")
       
       }
    
    func updateEnemyCountLabel() {
          let enemyCount = UserDefaults.standard.integer(forKey: "enemyCount")
          enemyCountLabel.text = "倒した敵: \(enemyCount)体"
        let Money = UserDefaults.standard.integer(forKey: "Money")
        MoneyLabel.text = "\(Money)円"
     
       
      }
    
    func updateDataInModal() {
        // データの更新処理
        incrementEnemyCount()

        // モーダルを閉じる
        dismiss(animated: true) {
            // モーダルが閉じられた後に実行される処理
            // 例: ホーム画面のデータを更新
            self.updateEnemyCountLabel()
        }
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
        super.viewWillAppear(animated)
                updateEnemyCountLabel()
        view.setNeedsLayout()
            view.layoutIfNeeded()
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TechMonManager.stopBGM()
        super.viewDidAppear(animated)
               updateEnemyCountLabel()
        
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
