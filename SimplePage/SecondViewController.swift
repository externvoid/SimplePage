import UIKit

class SecondVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidLayoutSubviews() {
    print("SecondVC")
    print((UIApplication.shared.delegate?.window??.rootViewController!
      as! PageViewController).cnt)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
