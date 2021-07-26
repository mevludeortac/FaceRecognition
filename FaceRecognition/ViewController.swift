//
//  ViewController.swift
//  FaceRecognition
//
//  Created by MEWO on 26.07.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func comeInClicked(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it really you?") { (success, error) in
                if success == true{
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toPutin", sender: nil)
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.txtMessage.text = "error!"
                    }
                }
            }
        }
        
    }
}

