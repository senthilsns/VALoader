//
//  ViewController.swift
//  VALoader
//
//  Created by Senthilkumar Kuppuraj on 11/04/22.
//

import UIKit

class ViewController: UIViewController {
    let indicator = VAActivityIndicatorView()

    @IBOutlet weak var customView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        customView.addSubview(indicator)
        setupActivityIndicatorViewConstraints()


    }

    @IBAction func startAction(_ sender: Any) {
        indicator.startAnimating()

    }

    @IBAction func stopAction(_ sender: Any) {
        indicator.stopAnimating()

    }

    func setupActivityIndicatorViewConstraints() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
    }
}

