//
//  ViewController.swift
//  Match the Members!
//
//  Created by Natasha Wong on 2/8/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundImageView: UIImageView!
    var overlayView: UIView!
    var startButton: UIButton!
    var titleScreen: UILabel!
    let swiftColor = UIColor(red: 0, green: 3/10, blue: 50, alpha: 0.5)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupOverlay()
        setupTitle()
        setupButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupBackground() {
        backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView.image = UIImage(named: "plswork")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
    }
    func setupTitle() {
        titleScreen = UILabel(frame: CGRect(x: 30, y: 200, width: view.frame.width-60, height: 200))
        titleScreen.text = "Do you know the Members?"
        titleScreen.textColor = .black
        titleScreen.font = UIFont.systemFont(ofSize: 28)
        titleScreen.textAlignment = .center
        view.addSubview(titleScreen)
    }
    
    func setupOverlay() {
        overlayView = UIView(frame: view.frame)
        overlayView.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        overlayView.alpha = 0.05
        view.addSubview(overlayView)
    }
    
    func setupButton() {
        startButton = UIButton(frame: CGRect(x: 30, y:400, width: view.frame.width-60, height: 40))
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = swiftColor
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    @objc func startButtonTapped() {
        performSegue(withIdentifier: "toMatches", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

