//
//  MentalHealthVC.swift
//  FinalProject
//
//  Created by Scholar on 8/3/21.
//

import UIKit

class MentalHealthVC: UIViewController {
    @IBOutlet weak var hotlinesLabel: UILabel!
    @IBOutlet weak var resourcesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hotlinesLabel.isHidden = true
        resourcesLabel.isHidden = true
    }
    
    @IBAction func hotlineButton(_ sender: UIButton) {
        hotlinesLabel.isHidden = false
        resourcesLabel.isHidden = true
    }
    
    @IBAction func resourcesButton(_ sender: UIButton) {
        resourcesLabel.isHidden = false
        hotlinesLabel.isHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
