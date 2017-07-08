
import UIKit



class LandscapeViewController: UIViewController {

    var isPresented = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.landscapeLeft
  }
  
  @IBAction func forcePortrait(_ sender: AnyObject) {
    
    self.dismiss(animated: true, completion: nil)
    
  }
    
  

}
