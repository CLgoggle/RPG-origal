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
    @IBOutlet var nanidoLabel: UILabel!
    
    var animalArray: [Enemy] = [
    enemy,raizin,mahotukai,yaritukai,mazin,rich
    ]
    
    var nanidoArray = ["簡単","普通","難しい"]
    
    var index: Int = 0
    var index2: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        TechMonManager.playBGM(fileName: "sentaku_BGM")
        // Do any additional setup after loading the view.
        setUI()
        setUI2()
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
            
            var ratio = 1
            if nanidoArray[index2] == "簡単" {
                ratio = 1
            }else if nanidoArray[index2] == "普通"{
                ratio = 2
            }else {
                ratio = 4
            }
            nextView.enemy.maxHP = nextView.enemy.maxHP * Float(ratio)
            nextView.enemy.currentHP = nextView.enemy.maxHP
            if ratio > 1{
                nextView.enemy.attackPoint = nextView.enemy.attackPoint * Float(ratio / 2)
            }else {
                nextView.enemy.attackPoint = nextView.enemy.attackPoint * Float(ratio)
            }
        }
        animalArray = [enemy,raizin,mahotukai,yaritukai,mazin,rich]
    }
    @IBAction func next2(){
        if index2 == nanidoArray.count - 1 {
            index2 = 0
        }else {
            index2 += 1
        }
        setUI2()
        
    }
    
    @IBAction func back2(){
        if index2 == 0 {
            index = nanidoArray.count - 1
        }else {
            
            index2 -= 1
        }
        setUI2()
    }
    
    @IBAction func back1234(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUI2() {
        nanidoLabel.text = nanidoArray[index2]
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
