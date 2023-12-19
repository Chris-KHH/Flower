//
//  FlowerViewController.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import UIKit

var prunusmumeTimer: Timer?
var otherFlowerTimer: Timer?
var dragonfilyTimer: Timer?

class FlowerViewController: UIViewController {
    var flowerInfo:FlowerInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if flowerInfo.prunusmumeSec >= 0 {

            prunusmumeTimer = Timer.scheduledTimer(withTimeInterval: flowerInfo.prunusmumeSec, repeats: true) { _ in
                guard case Int.random(in: self.flowerInfo.prunusmumeRandom...1) = 1 else { return }
                self.view.addSubview(makePrunusmume(showRandom: true))
            }
        }
        
        if flowerInfo.otherFlowerSec >= 0 {
            otherFlowerTimer = Timer.scheduledTimer(withTimeInterval: flowerInfo.otherFlowerSec, repeats: true) { _ in
                guard case Int.random(in: self.flowerInfo.otherFlowerRandom...1) = 1 else { return }
                self.view.addSubview(makeOtherFlower(showRandom: true))
            }
        }
     
        if flowerInfo.dragonfilySec >= 0 {
            dragonfilyTimer = Timer.scheduledTimer(withTimeInterval: flowerInfo.dragonfilySec, repeats: true) { _ in
                guard case Int.random(in: self.flowerInfo.dragonfilyRandom...1) = 1 else { return }
                self.view.addSubview(makeDragonfily(showRandom: true))
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: flowerInfo.totalSec, repeats: true) { _ in
             prunusmumeTimer?.invalidate()
             otherFlowerTimer?.invalidate()
             dragonfilyTimer?.invalidate()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
        
            prunusmumeTimer?.invalidate()
            otherFlowerTimer?.invalidate()
            dragonfilyTimer?.invalidate()
    }
}
