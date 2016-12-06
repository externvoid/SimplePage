import UIKit

class ThirdVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidLayoutSubviews() {
    print("ThirdVC")
    print((UIApplication.shared.delegate?.window??.rootViewController!
      as! PageViewController).cnt)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
