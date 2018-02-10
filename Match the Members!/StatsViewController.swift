//
//  StatsViewController.swift
//  Match the Members!
//
//  Created by Natasha Wong on 2/8/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var longestStreak = Int()
    var lastAnswers = [String]()
    var lastPeople = [String]()
    
    var lastPersonImage = String()
    var secondLastPersonImage = String()
    var thirdLastPersonImage = String()
    
    var lastPerson = String()
    var secondLastPerson = String()
    var thirdLastPerson = String()
    
    var lastAnswer = String()
    var secondLastAnswer = String()
    var thirdLastAnswer = String()
    
    var imageOne: UIImageView!
    var imageTwo: UIImageView!
    var imageThree: UIImageView!
    
    var firstPerson: UILabel!
    var secondPerson: UILabel!
    var thirdPerson: UILabel!

    var stats: UIImageView!
    var q: UIImageView!
    var str: UIImageView!
    
    var longstr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeople()
        getAnswers()
        
        stats = UIImageView(frame: CGRect(x: 70, y: 60, width: view.frame.width-140, height: 50))
        stats.image = UIImage(named: "Stats")
        view.addSubview(stats)
        
        str = UIImageView(frame: CGRect(x: 110, y: 120, width: view.frame.width-220, height: 40))
        str.image = UIImage(named: "Streak")
        view.addSubview(str)
        
        q = UIImageView(frame: CGRect(x: 50, y: 280, width: view.frame.width-100, height: 60))
        q.image = UIImage(named: "Questions")
        view.addSubview(q)
        
        longstr = UILabel(frame: CGRect(x: 30, y: 170, width: view.frame.width-60, height: 100))
        longstr.text = "\(longestStreak)"
        longstr.textColor = .black
        longstr.font = UIFont.systemFont(ofSize: 50)
        longstr.textAlignment = .center
        view.addSubview(longstr)
        
        firstPerson = UILabel(frame: CGRect(x: 0, y: 600, width: 140, height: 40))
        firstPerson.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        firstPerson.alpha = 0.7
        firstPerson.text = "   1. \(lastAnswer)"
        firstPerson.textColor = .white
        view.addSubview(firstPerson)
        
        secondPerson = UILabel(frame: CGRect(x: 142, y: 600, width: 140, height: 40))
        secondPerson.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        secondPerson.alpha = 0.7
        secondPerson.text = "   2. \(secondLastAnswer)"
        secondPerson.textColor = .white
        view.addSubview(secondPerson)
        
        thirdPerson = UILabel(frame: CGRect(x: 284, y: 600, width: 140, height: 40))
        thirdPerson.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        thirdPerson.alpha = 0.7
        thirdPerson.text = "   3. \(thirdLastAnswer)"
        thirdPerson.textColor = .white
        view.addSubview(thirdPerson)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    func getPeople() {
        if lastPeople.count >= 3 {
            lastPerson = lastPeople[lastPeople.count-1]
            secondLastPerson = lastPeople[lastPeople.count-2]
            thirdLastPerson = lastPeople[lastPeople.count-3]
            makeStatsPictures()
        }
        if lastAnswers.count == 2 {
            lastPerson = lastPeople[lastPeople.count-1]
            secondLastPerson = lastPeople[0]
            makeStatsPictures()
        }
        if lastAnswers.count == 1 {
            lastPerson = lastPeople[0]
            makeStatsPictures()
        }
    }
    func getAnswers() {
        if lastAnswers.count >= 3 {
            lastAnswer = lastAnswers[lastAnswers.count-1]
            secondLastAnswer = lastAnswers[lastAnswers.count-2]
            thirdLastAnswer = lastAnswers[lastAnswers.count-3]
        }
        if lastAnswers.count == 2 {
            lastAnswer = lastAnswers[lastAnswers.count-1]
            secondLastAnswer = lastAnswers[0]
        }
        if lastAnswers.count == 1 {
            lastAnswer = lastAnswers[0]
        }
    }
    func makeStatsPictures() {
        if lastAnswers.count >= 3 {
            imageOne = UIImageView(frame: CGRect(x: 0, y: 370, width: 140, height: 200))
            lastPersonImage = lastPerson.lowercased()
            lastPersonImage = lastPersonImage.replacingOccurrences(of: " ", with: "")
            imageOne.image = UIImage(named: lastPersonImage)
            view.addSubview(imageOne)
            
            
            imageTwo = UIImageView(frame: CGRect(x: 142, y: 370, width: 140, height: 200))
            secondLastPersonImage = secondLastPerson.lowercased()
            secondLastPersonImage = secondLastPersonImage.replacingOccurrences(of: " ", with: "")
            imageTwo.image = UIImage(named: secondLastPersonImage)
            view.addSubview(imageTwo)
            
            imageThree = UIImageView(frame: CGRect(x: 284, y: 370, width: 140, height: 200))
            thirdLastPersonImage = thirdLastPerson.lowercased()
            thirdLastPersonImage = thirdLastPersonImage.replacingOccurrences(of: " ", with: "")
            imageThree.image = UIImage(named: thirdLastPersonImage)
            view.addSubview(imageThree)
        }
        
        if lastAnswers.count == 2 {
            imageOne = UIImageView(frame: CGRect(x: 0, y: 370, width: 140, height: 200))
            lastPersonImage = lastPerson.lowercased()
            lastPersonImage = lastPersonImage.replacingOccurrences(of: " ", with: "")
            imageOne.image = UIImage(named: lastPersonImage)
            view.addSubview(imageOne)
            
            imageTwo = UIImageView(frame: CGRect(x: 142, y: 370, width: 140, height: 200))
            secondLastPersonImage = secondLastPerson.lowercased()
            secondLastPersonImage = secondLastPersonImage.replacingOccurrences(of: " ", with: "")
            imageTwo.image = UIImage(named: secondLastPersonImage)
            view.addSubview(imageTwo)
        }
        
        if lastAnswers.count == 1 {
            imageOne = UIImageView(frame: CGRect(x: 0, y: 370, width: 140, height: 200))
            lastPersonImage = lastPerson.lowercased()
            lastPersonImage = lastPersonImage.replacingOccurrences(of: " ", with: "")
            imageOne.image = UIImage(named: lastPersonImage)
            view.addSubview(imageOne)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
