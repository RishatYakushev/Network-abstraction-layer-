//
//  ViewController.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    private lazy var swappiNetworking: SwappiNetworking = SwappiNetworkingImp(
        networking: AppDelegate.networking
    )
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getUserRewards()
    }
    
    private func getUserRewards() {
        firstly {
            swappiNetworking.getPeople()
        }.done(on: .main) { emptyObject in
            print(emptyObject)
        }.catch { error in
            print(error)
        }
    }
}
