import UIKit

class bougusentakuViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nanidoLabel: UILabel!
    
    var bouguArray: [String] = ItemStorage.bouguArray
    var bouguNameArray: [String] = ItemStorage.bouguNameArray
    var bouguSutiArray: [Int] = ItemStorage.bouguSutiArray
    
    var bouguKaisetuArray: [String] = ItemStorage.bouguKaisetuArray
    
    var index: Int = 0
    
        


    override func viewDidLoad() {
        super.viewDidLoad()
        bouguArray = ItemStorage.showMyBougu(bouguArray)
        bouguNameArray = ItemStorage.showMyBougu(bouguNameArray)
        bouguSutiArray = ItemStorage.showMyBougu(bouguSutiArray)
setUI()
        // Do any additional setup after loading the view.
    }
    
   
    
    func setUI() {
        imageView.image = UIImage(named: bouguArray[index])
        nameLabel.text = bouguNameArray[index]
        nanidoLabel.text = bouguKaisetuArray[index]
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
        let Value3 = bouguSutiArray[index]
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

