//
//  BattleViewController.swift
//  RPG
//
//  Created by goggle CL on 2023/04/30.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPBar: UIProgressView!
    @IBOutlet var playerTP: UILabel!
    
    @IBOutlet var enemyNameLabel: UILabel!
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var enemyHPBar: UIProgressView!
    
    var str = ""
    var player: Player!
    var enemy: Enemy!
    let defaults = UserDefaults.standard
    var currentMoney: UInt32 = 0
    
    
    var enemyAttakTime: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        playerHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        enemyHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        
        player = Player(name: "主人公", imageName: "yusya.png", attackPoint: 20, fireAttackPoint: 100, maxHP: 100, maxTP: 100, bahu: 0)
        
//        enemy = Enemy(name: "ドラゴン", imageName: "monster.png", attackPoint: 10, maxHP: 300)
        
        playerNameLabel.text = player.name
        playerImageView.image = player.image
        
        enemyNameLabel.text = enemy.name
        enemyImageView.image = enemy.image
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TechMonManager.playBGM(fileName: "BGM_battle001")
        
        enemyAttakTime = Timer.scheduledTimer(
        timeInterval: 1.5,
        target: self,
        selector: #selector(enemyAttack),
        userInfo: nil,
        repeats: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TechMonManager.stopBGM()
    }
    
    func updateUI(){
        playerHPBar.progress = player.currentHP / player.maxHP
        enemyHPBar.progress = enemy.currentHP / enemy.maxHP
    }
    
    @IBAction func attackAction() {
        TechMonManager.damageAnimation(imageView: enemyImageView)
        TechMonManager.playSE(fileName: "SE_attack")
        let savedValue2 = UserDefaults.standard.integer(forKey: "bukiattack")
        enemy.currentHP -= player.attackPoint + Float(player.bahu) + Float(savedValue2)
        
        
        
        player.currentTP += 5
        if player.currentTP >= player.maxTP {
            player.currentTP = player.maxTP
        }
        playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        
        updateUI()
        
        judgeenemy()
    }
    
    
    
    
    @IBAction func chargeAtcion() {
        TechMonManager.playSE(fileName: "SE_charge")
        
        player.currentTP += 20
        if player.currentTP >= player.maxTP{
            player.currentTP = player.maxTP
        }
        playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        updateUI()
    }
    
    @IBAction func bahus() {
        if player.currentTP >= 75{
            player.bahu += 15
            player.currentTP = player.currentTP - 75
            playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        }
        
        updateUI()
        judgeenemy()
    }
    
    @IBAction func fireAction() {
        if player.currentTP >= player.maxTP {
            TechMonManager.damageAnimation(imageView: enemyImageView)
            TechMonManager.playSE(fileName: "SE_fire")
            
            enemy.currentHP -= player.fireAttackPoint + Float(player.bahu)
            
            player.currentTP = 0
            playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        }
        
        updateUI()
        
        judgeenemy()
    }
    
    @IBAction func iceAction() {
        if player.currentTP >= 25 {
            TechMonManager.damageAnimation(imageView: enemyImageView)
            TechMonManager.playSE(fileName: "SE_fire")
            
            enemy.currentHP -= Float(40 + player.bahu)
            
            player.currentTP = 0
            playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        }
        
        updateUI()
        judgeenemy()
    }
    
    @IBAction func healaction() {
        if player.currentTP >= 50 {
            TechMonManager.damageAnimation(imageView: enemyImageView)
            TechMonManager.playSE(fileName: "SE_fire")
            
            player.currentHP += 60
            
            player.currentTP = player.currentTP - 50
            if player.currentHP >= player.maxHP {
                player.currentHP = player.maxHP
            }
            playerTP.text = "\(player.currentTP) / \(player.maxTP)"
        }
        
        updateUI()
        judgeenemy()
        
    }
    
    
    @objc func enemyAttack() {
        TechMonManager.damageAnimation(imageView: playerImageView)
        TechMonManager.playSE(fileName: "SE_attack")
        let savedValue3 = UserDefaults.standard.integer(forKey: "bougusuti")
        player.currentHP -= enemy.attackPoint - Float(savedValue3)
        
        updateUI()
        
        if player.currentHP <= 0 {
            finishBattle(vanishImageView: playerImageView, isPlayerWin: false)
        }
    }
    
    func finishBattle(vanishImageView: UIImageView, isPlayerWin: Bool) {
        TechMonManager.vanishAnimation(imageView: vanishImageView)
        TechMonManager.stopBGM()
        enemyAttakTime.invalidate()
        
        var finishMessage: String = ""
        if isPlayerWin {
            TechMonManager.playSE(fileName: "SE_fanfare")
            finishMessage = "勇者の勝利!!"
        } else {
            TechMonManager.playSE(fileName: "SE_gameover")
            finishMessage = "勇者の敗北..."
        }
        let alert = UIAlertController(
        title: "バトル終了",
        message: finishMessage,
        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in self.dismiss(animated: true)}))
        present(alert, animated: true)
        enemy.currentHP = enemy.maxHP
    }
    func judgeenemy() {
        if enemy.currentHP <= 0 {
            var enemyCount = defaults.integer(forKey: "enemyCount")
            var Money = defaults.integer(forKey: "Money")
            enemyCount += 1
            if enemy.name == "ドラゴン" {
                Money += 100
            }else if enemy.name == "雷神"{
                Money += 200
            }else if enemy.name == "魔法使い"{
                Money += 300
            }else if enemy.name == "槍使い"{
                Money += 400
            }else if enemy.name == "魔神"{
                Money += 500
            }else if enemy.name == "金持ち"{
                Money += 600
            }
            defaults.set(enemyCount, forKey: "enemyCount")
            defaults.set(Money, forKey: "Money")
            finishBattle(vanishImageView: enemyImageView, isPlayerWin: true)
        }    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
