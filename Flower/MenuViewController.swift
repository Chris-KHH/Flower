//
//  MenuViewController.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/15.
//

import UIKit

class MenuViewController: UIViewController {

    var flowerInfo = FlowerInfo()
    @IBOutlet weak var showPrunusmume: UIView!
    @IBOutlet weak var showOtherFlower: UIView!
    @IBOutlet weak var showDragonfily: UIView!
    
    @IBOutlet weak var prunusmumeTextField: UITextField!
    @IBOutlet weak var otherFlowerTextField: UITextField!
    @IBOutlet weak var dragonfilyTextField: UITextField!
    @IBOutlet weak var prunusmumeSwitch: UISwitch!
    @IBOutlet weak var otherFlowerSwitch: UISwitch!
    @IBOutlet weak var dragonfilySwitch: UISwitch!
    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var msgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPrunusmume.addSubview(makePrunusmume(showRandom: false))
        showOtherFlower.addSubview(makeOtherFlower(showRandom: false))
        showDragonfily.addSubview(makeDragonfily(showRandom: false))
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        msgLabel.text = ""
        
        switch identifier {
        case "userShow":
            if let prunusmumeSec = Double(prunusmumeTextField.text!) { flowerInfo.prunusmumeSec = prunusmumeSec } else { flowerInfo.prunusmumeSec = -1 }
            if prunusmumeSwitch.isOn { flowerInfo.prunusmumeRandom = 0 } else { flowerInfo.prunusmumeRandom = 1 }
         
            if let otherFlowerSec = Double(otherFlowerTextField.text!) { flowerInfo.otherFlowerSec = otherFlowerSec } else { flowerInfo.otherFlowerSec = -1 }
            if otherFlowerSwitch.isOn { flowerInfo.otherFlowerRandom = 0 } else { flowerInfo.otherFlowerRandom = 1 }
            
            if let dragonfilySec = Double(dragonfilyTextField.text!) { flowerInfo.dragonfilySec = dragonfilySec } else { flowerInfo.dragonfilySec = -1 }
            if dragonfilySwitch.isOn { flowerInfo.dragonfilyRandom = 0 } else { flowerInfo.dragonfilyRandom = 1 }
            
            if let totalSec = Double(totalTextField.text!) {
                flowerInfo.totalSec = totalSec
            } else {
                msgLabel.text = "🙁尚未設定繪圖總秒數"
                return false
            }
        
            guard flowerInfo.prunusmumeSec >= 0 || flowerInfo.otherFlowerSec >= 0 || flowerInfo.dragonfilySec >= 0  else { return false }

            return true
            
        default:
            flowerInfo = FlowerInfo(prunusmumeSec: 2, prunusmumeRandom: 1, otherFlowerSec: 1, otherFlowerRandom: 0, dragonfilySec: 5, dragonfilyRandom: 1, totalSec: 20)
            
            prunusmumeTextField.text = String(Int(flowerInfo.prunusmumeSec))
            if flowerInfo.prunusmumeRandom == 0 { prunusmumeSwitch.isOn = true } else { prunusmumeSwitch.isOn = false }
            otherFlowerTextField.text = String(Int(flowerInfo.otherFlowerSec))
            if flowerInfo.otherFlowerRandom == 0 { otherFlowerSwitch.isOn = true } else { otherFlowerSwitch.isOn = false }
            dragonfilyTextField.text = String(Int(flowerInfo.dragonfilySec))
            if flowerInfo.dragonfilyRandom == 0 { dragonfilySwitch.isOn = true } else { dragonfilySwitch.isOn = false }
            totalTextField.text = String(Int(flowerInfo.totalSec))
            
            return true
        }
    }

    @IBSegueAction func showFlower(_ coder: NSCoder) -> FlowerViewController? {

        let controller = FlowerViewController(coder: coder)
        controller?.flowerInfo = flowerInfo
        
        return controller
    }
    
}
