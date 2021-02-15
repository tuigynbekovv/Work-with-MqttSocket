/*
 *  MainViewController.swift
 *  WorkWithMqtt
 *
 *  Created by tuigynbekov on 2/15/21.
 */

import UIKit

class MainViewController: UIViewController {
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK:- Autolayout
    func setupViews() {
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
    }
}
