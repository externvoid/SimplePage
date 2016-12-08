import UIKit

class FirstVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = Bundle.main.loadNibNamed("SomeView", owner: self, options: nil)?.first! as! UIView
//    self.view = UINib(nibName: "SomeView", bundle: nil)
//      .instantiate(withOwner: self, options: nil).first as! UIView
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
