//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 19.07.21.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func saveTapped() {
        let vc = parent as! ArtistViewController
        vc.updateTime(self.slider.value)
    }
    
    @IBAction func onSliderChange() {
        var value = "\(slider.value.rounded(toPlaces: 2))"
        while value.count < 4 {
            value += "0"
        }
        timeLabel.text = "\(value) s"
    }
    
    func setupUI() {
        saveButton.layer.cornerRadius = 10
        view.layer.cornerRadius = 40
        addShadow(view: saveButton, radius: 2)
        addShadow(view: view, radius: 8)
    }
    
    func addShadow(view: UIView, radius: CGFloat) {
        view.layer.shadowRadius = radius
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.25;
        view.layer.masksToBounds = false;
    }
}

extension Float {
    func rounded(toPlaces places:Int) -> Float {
        let divisor = Float(pow(10.0, Double(places)))
        return (self * divisor).rounded() / divisor
    }
}
