import UIKit

class PageViewController: UIPageViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
    self.dataSource = self
  }
  
  func getFirst() -> FirstViewController {
    return storyboard!.instantiateViewController(withIdentifier:"FirstViewController") as! FirstViewController
  }
func getSecond() -> SecondViewController {
  return storyboard!.instantiateViewController(withIdentifier:"SecondViewController") as! SecondViewController
}

func getThird() -> ThirdViewController {
  return storyboard!.instantiateViewController(withIdentifier:"ThirdViewController") as! ThirdViewController
}
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
//以下追加
extension PageViewController : UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore  viewController: UIViewController) -> UIViewController? {
    if viewController is ThirdViewController {
      // 3 -> 2
      return getSecond()
    } else if viewController is SecondViewController {
      // 2 -> 1
      return getFirst()
    } else {
      // 1 -> end of the road
      return nil
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if viewController is FirstViewController {
      // 1 -> 2
      return getSecond()
    } else if viewController is SecondViewController {
      // 2 -> 3
      return getThird()
    } else {
      // 3 -> end of the road
      return nil
    }
  }
}
