
import UIKit

class PortraitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      UIDevice.current.beginGeneratingDeviceOrientationNotifications()
     

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }

  deinit {
  
    NotificationCenter.default.removeObserver(self)
    UIDevice.current.endGeneratingDeviceOrientationNotifications()
  }
  
    @IBAction func backButtonAction(_ sender: Any) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
         self.dismiss(animated: true, completion: nil)
        
    }
  
  // button --
  @IBAction func forceLandscape(_ sender: AnyObject) {
    let value = UIInterfaceOrientation.landscapeLeft.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")
    self.perform(#selector(PortraitViewController.updateLandscapeView), with: nil, afterDelay: 0)
    
  }
 
  
  
}

extension PortraitViewController {


  func updateLandscapeView() {
    // Get the device's current orientation.  By the time the
    // UIDeviceOrientationDidChangeNotification has been posted, this value
    // reflects the new orientation of the device.
    let deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation
    if UIDeviceOrientationIsLandscape(deviceOrientation) && self.presentedViewController == nil {
      // Trigger the segue to present LandscapeViewController modally.
      self.performSegue(withIdentifier: "PresentLandscapeViewControllerSegue", sender: self)
    }
    else if deviceOrientation == .portrait && self.presentedViewController != nil {
      self.dismiss(animated: true, completion: { _ in })
    }
    
  }
}
