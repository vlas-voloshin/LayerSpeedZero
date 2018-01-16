//
//  Copyright © 2018 Vlas Voloshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // This approach is often used to manually implement interactive animations: either because the app cannot use UIViewPropertyAnimator for this (targets below iOS 10) or because it needs to use and track custom CA animations
        self.button.layer.speed = 0

        // WORKAROUND: prevents implicit animations to be added inside the button when the alert dims the tint - which happens even though the button has Custom style!
//        self.button.tintAdjustmentMode = .normal
    }

    @IBAction func presentAlert(_ sender: Any!) {
        let title: String
        let message: String
        let buttonTitle: String

        if #available(iOS 10.0, *) {
            title = "Whoopsie"
            message = "Running iOS 10 or later – you won't be able to interact with this alert unless you put the app to background and back to foreground."
            buttonTitle = "Try and dismiss me"
        } else {
            title = "Alert"
            message = "You should be able to interact with this alert."
            buttonTitle = "Dismiss"
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

}
