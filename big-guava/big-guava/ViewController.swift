//
//  ViewController.swift
//  big-guava
//
//  Created by André Toti on 18/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewAnimada: UIView!
    
    // MARK: - View Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func botaoIniciarAnimacao(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: {
            self.viewAnimada.frame = CGRect(x: 285.0, y: self.viewAnimada.frame.origin.y, width: self.viewAnimada.frame.size.width, height: self.viewAnimada.frame.size.height)
        }, completion: nil)
    }
}


