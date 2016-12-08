import UIKit

class PageViewController: UIPageViewController {
  var cnt: Int = 0
  var cPage: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
    self.dataSource = self
    self.delegate = self
  }
  
  func getFirst() -> FirstVC {
      return FirstVC()
//    return storyboard!.instantiateViewController(withIdentifier:"FirstVC")
//      as! FirstVC
  }
  func getSecond() -> SecondVC {
    return storyboard!.instantiateViewController(withIdentifier:"SecondVC")
      as! SecondVC
  }

  func getThird() -> ThirdVC {
    return storyboard!.instantiateViewController(withIdentifier:"ThirdVC")
      as! ThirdVC
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
extension PageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController,
                          willTransitionTo pendingViewControllers: [UIViewController]) {
    print("willTransitonTo")
  }
  func pageViewController(_ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
    if completed {
      print(previousViewControllers.first!)
      print("didFinish")
//      print(self.childViewControllers.first!)
    }
  }
}

// after view：過ぎたview, before view：前のview
// B comes after A in the alphabet.Aが過ぎてからBが来る。
extension PageViewController : UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                       viewControllerAfter viewController: UIViewController) -> UIViewController? {
    cnt += 1
    print("going forward \(cnt)")
    if viewController is FirstVC {
      // 1 -> 2
      return getSecond()
    } else if viewController is SecondVC {
      // 2 -> 3
      return getThird()
    } else if viewController is ThirdVC {
      // 3 -> 1
      return getFirst()
      
    } else {
      //   -> end of the road
      return nil
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                      viewControllerBefore viewController: UIViewController) -> UIViewController? {
    cnt += 1
    print("going backward \(cnt)")
    if viewController is ThirdVC {
      // 3 -> 2
      return getSecond()
    } else if viewController is SecondVC {
      // 2 -> 1
      return getFirst()
    } else if viewController is FirstVC {
      // 1 -> 3
      return getThird()
    } else {
      //   -> end of the road
      return nil
    }
  }
}
