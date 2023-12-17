import UIKit

class bougusentakuViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nanidoLabel: UILabel!
    
    var bouguArray: [String] = [
        "armor_koshiate_green","armor_koshiate_blue","armor_koshiate_red","armor_koshiate_iron"
    ]
    var nameArray: [String] = [
        "風の防具","水の防具","炎の防具","鉄の防具"
    ]
    var bougusuti: [Int] = [
        3,3,3,3
    ]
    
    var nanido2Array: [String] = ["風属性の攻撃に耐性がある防具",
                                 "水属性の攻撃に耐性がある防具",
                                 "炎属性の攻撃に耐性がある防具",
                                 "一般的な防具"]
    
    var index: Int = 0
    
        


    override func viewDidLoad() {
        super.viewDidLoad()
setUI()
        // Do any additional setup after loading the view.
    }
    
   
    
    func setUI() {
        imageView.image = UIImage(named: bouguArray[index])
        nameLabel.text = nameArray[index]
        nanidoLabel.text = nanido2Array[index]
    }
    
    @IBAction func next(){
        if index == bouguArray.count - 1 {
            index = 0
        }else {
            index += 1
        }
        setUI()
        
    }
    
    @IBAction func back(){
        if index == 0 {
            index = bouguArray.count - 1
        }else {
            
            index -= 1
        }
        setUI()
    }
    
    @IBAction func close(){
        let Value = bouguArray[index]
        UserDefaults.standard.set(Value, forKey: "bougu")
        let Value3 = bougusuti[index]
        UserDefaults.standard.set(Value3, forKey: "bougusuti")

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

