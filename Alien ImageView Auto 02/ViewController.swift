import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countLbl: UILabel!
    
    var check = false, count = 1
    var mTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "frame1.png")
    }

    func autoChange() {
        if (!check) {
            if (count == 5) {
                check = true;
                count -= 1;
            } else {
                count += 1;
            }
        } else {
            if (count == 1) {
                check = false;
                count += 1;
            } else {
                count -= 1;
            }
        }
        
        imageView.image = UIImage(named: "frame" + String(count) + ".png")
        countLbl.text = String(count) + " 번 사진"
    }
    
    @IBAction func playBtn(_ sender: Any) {
        if (!mTimer.isValid) {
            mTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
                self.autoChange()
            })
        }
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        if (mTimer.isValid) {
            mTimer.invalidate()
        }
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        mTimer.invalidate()
            
        count = 1
            
        imageView.image = UIImage(named: "frame" + String(count) + ".png")
        countLbl.text = String(count) + " 번 사진"
    }
}
