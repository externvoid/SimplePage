import UIKit

class FirstVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidLayoutSubviews() {
    print("FirstVC")
    print((UIApplication.shared.delegate?.window??.rootViewController!
        as! PageViewController).cnt)

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
