//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 19.07.21.
//

import UIKit

class DrawingsViewController: UIViewController {

    @IBOutlet var drawingsButtons: [UIButton]!
    
    @objc var currentActive = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in drawingsButtons {
            button.layer.cornerRadius = 10
            addShadow(view: button, radius: 2, opacaity: 0.25)
            button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
        updateActive()
    }
    
    @objc func tapped(button: UIButton) {
        for i in 0..<drawingsButtons.count {
            if drawingsButtons[i] == button {
                currentActive = i
                updateActive()
                let vc = navigationController!.viewControllers[navigationController!.viewControllers.count - 2] as! ArtistViewController
                vc.updateDrawing(Int32(i))
                navigationController?.popViewController(animated: true)
                break
            }
        }
    }
    
    func updateActive() {
        for i in 0..<drawingsButtons.count {
            if i == currentActive {
                addShadow(view: drawingsButtons[i], radius: 4, opacaity: 1.0, color: UIColor(named: "Light Green Sea")!)
            } else {
                addShadow(view: drawingsButtons[i], radius: 2, opacaity: 0.25)
            }
        }
    }
    
    func addShadow(view: UIView, radius: CGFloat, opacaity: Float, color: UIColor = UIColor.black) {
        view.layer.shadowRadius = radius
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = opacaity;
        view.layer.masksToBounds = false;
    }
}
