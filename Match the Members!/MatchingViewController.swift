//
//  MatchingViewController.swift
//  Match the Members!
//
//  Created by Natasha Wong on 2/8/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit

class MatchingViewController: UIViewController {
    let names = ["Daniel Andrews", "Nikhar Arora", "Tiger Chen", "Xin Yi Chen", "Julie Deng", "Radhika Dhomse", "Kaden Dippe", "Angela Dong", "Zach Govani", "Shubham Gupta", "Suyash Gupta", "Joey Hejna", "Cody Hsieh", "Stephen Jayakar", "Aneesh Jindal", "Mohit Katyal", "Mudabbir Khan", "Akkshay Khoslaa", "Justin Kim", "Eric Kong", "Abhinav Koppu", "Srujay Korlakunta", "Ayush Kumar", "Shiv Kushwah", "Leon Kwak", "Sahil Lamba", "Young Lin", "William Lu", "Louie McConnell", "Max Miranda", "Will Oakley", "Noah Pepper", "Samanvi Rai", "Krishnan Rajiyah", "Vidya Ravikumar", "Shreya Reddy", "Amy Shen", "Wilbur Shi", "Sumukh Shivakumar", "Fang Shuo", "Japjot Singh", "Victor Sun", "Sarah Tang", "Kanyes Thaker", "Aayush Tyagi", "Levi Walsh", "Carol Wang", "Sharie Wang", "Ethan Wong", "Natasha Wong", "Aditya Yadav", "Candice Ye", "Vineeth Yeevani", "Jeffrey Zhang"]
    var getName = String()
    var answerName = String()
    var otherNames = String()
    var randomName = String()

    var timer = Timer()
    var seconds = 5
    var isTimerRunning = false
    var resumeTapped = false
    
    var imageForName: UIImageView!
    var scoreView: UILabel!
    
    var button1: UIButton!
    var button2: UIButton!
    var button3: UIButton!
    var button4: UIButton!
    var stopButton: UIButton!
    var statButton: UIButton!
    var buttons = [UIButton!]()
    
    var score = 0
    var indexButtonAnswer = Int()
    var streaks = [0]
    var longestStreak = Int()
    var bestStreak = Int()
    var lastThreeQuestions = [String]()
    var lastThreePeople = [String]()

    
    
    var correctAnswer = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button1, button2, button3, button4]
        getImage()
        setupScoreView()
            //setupStatButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        runTimer()
    }
    
    func setupScoreView() {
        scoreView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        scoreView.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        scoreView.alpha = 0.7
        scoreView.font = UIFont.systemFont(ofSize: 30)
        scoreView.text = "     Score: \(score)"
        scoreView.textColor = .white
        view.addSubview(scoreView)
        setupStatButton()
        
    }
    
    @objc func getImage() {
        imageForName = UIImageView(frame: CGRect(x: 25, y: 100, width: view.frame.width - 60, height: 370))
        getName = names[Int(arc4random_uniform(UInt32(names.count)))]
        answerName = getName.lowercased()
        answerName = answerName.replacingOccurrences(of: " ", with: "")
        imageForName.image = UIImage(named: answerName)
        view.addSubview(imageForName)
        setupButtons()
        
    }
    func setupButtons() {
        enableButtons()
        indexButtonAnswer = Int(arc4random_uniform(UInt32(4))) + 1
        stopButton = UIButton(frame: CGRect(x: 30, y:700, width: view.frame.width-60, height: 25))
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.black, for: .normal)
        stopButton.backgroundColor = UIColor(hue: 0.1667, saturation: 0.35, brightness: 0.97, alpha: 1.0)
        stopButton.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        view.addSubview(stopButton)
        if indexButtonAnswer == 1 {
            button1 = UIButton(frame: CGRect(x: 30, y:500, width: view.frame.width-60, height: 40))
            button1.setTitle(getName, for: .normal)
            button1.setTitleColor(.white, for: .normal)
            button1.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button1.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
            view.addSubview(button1)
            
            button2 = UIButton(frame: CGRect(x: 30, y:550, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button2.setTitle(randomName, for: .normal)
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button2.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button2)
            
            button3 = UIButton(frame: CGRect(x: 30, y:600, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button3.setTitle(randomName, for: .normal)
            button3.setTitleColor(.white, for: .normal)
            button3.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button3.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button3)
            
            button4 = UIButton(frame: CGRect(x: 30, y:650, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button4.setTitle(randomName, for: .normal)
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button4.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button4)
            
        } else if indexButtonAnswer == 2 {
            button1 = UIButton(frame: CGRect(x: 30, y:500, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button1.setTitle(randomName, for: .normal)
            button1.setTitleColor(.white, for: .normal)
            button1.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button1.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button1)
            
            button2 = UIButton(frame: CGRect(x: 30, y:550, width: view.frame.width-60, height: 40))
            button2.setTitle(getName, for: .normal)
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button2.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
            view.addSubview(button2)
            
            button3 = UIButton(frame: CGRect(x: 30, y:600, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button3.setTitle(randomName, for: .normal)
            button3.setTitleColor(.white, for: .normal)
            button3.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button3.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button3)
            
            button4 = UIButton(frame: CGRect(x: 30, y:650, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button4.setTitle(randomName, for: .normal)
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button4.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button4)
        } else if indexButtonAnswer == 3 {
            button1 = UIButton(frame: CGRect(x: 30, y:500, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button1.setTitle(randomName, for: .normal)
            button1.setTitleColor(.white, for: .normal)
            button1.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button1.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button1)
            
            button2 = UIButton(frame: CGRect(x: 30, y:550, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button2.setTitle(randomName, for: .normal)
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button2.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button2)
            
            button3 = UIButton(frame: CGRect(x: 30, y:600, width: view.frame.width-60, height: 40))
            button3.setTitle(getName, for: .normal)
            button3.setTitleColor(.white, for: .normal)
            button3.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button3.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
            view.addSubview(button3)
            
            button4 = UIButton(frame: CGRect(x: 30, y:650, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button4.setTitle(randomName, for: .normal)
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button4.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button4)
        } else {
            button1 = UIButton(frame: CGRect(x: 30, y:500, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button1.setTitle(randomName, for: .normal)
            button1.setTitleColor(.white, for: .normal)
            button1.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button1.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button1)
            
            button2 = UIButton(frame: CGRect(x: 30, y:550, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button2.setTitle(randomName, for: .normal)
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button2.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button2)
            
            button3 = UIButton(frame: CGRect(x: 30, y:600, width: view.frame.width-60, height: 40))
            randomName = randomNameGenerator()
            button3.setTitle(randomName, for: .normal)
            button3.setTitleColor(.white, for: .normal)
            button3.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button3.addTarget(self, action: #selector(incorrectButtonTapped), for: .touchUpInside)
            view.addSubview(button3)
            
            button4 = UIButton(frame: CGRect(x: 30, y:650, width: view.frame.width-60, height: 40))
            button4.setTitle(getName, for: .normal)
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            button4.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
            view.addSubview(button4)
        }
    }
    
    @objc func randomNameGenerator() -> String {
        randomName = names[Int(arc4random_uniform(UInt32(names.count)))]
        if randomName == getName {
            return randomNameGenerator()
        } else {
            return randomName
        }
    }
    @objc func correctButtonTapped(sender: UIButton) {
        score+=1
        longestStreak+=1
        streaks.append(longestStreak)
        bestStreak = streaks.max()!
        disableButtons()
        lastThreeQuestions.append("Correct")
        lastThreePeople.append(getName)
        scoreView.text = "   Score: \(score)"
        UIView.animate(withDuration: 1) {
            sender.backgroundColor = .green
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
            self.getImage()
        }
        resetTimer()
    }
    
    @objc func incorrectButtonTapped(sender: UIButton) {
        disableButtons()
        lastThreeQuestions.append("Incorrect")
        lastThreePeople.append(getName)
        streaks.append(longestStreak)
        bestStreak = streaks.max()!
        longestStreak=0
        UIView.animate(withDuration: 1) {
            sender.backgroundColor = .red
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
            self.getImage()
        }
        resetTimer()
    }
    
    func resetTimer() {
        seconds = 5
        
    }
    
    @objc func stopAction() {
        timer.invalidate()
        resetTimer()
        dismiss(animated: true, completion: nil)
        timer.invalidate()
    }
   
    func disableButtons() {
        for b in buttons {
            b?.isEnabled = false
        }
    }
    func enableButtons() {
        for b in buttons {
            b?.isEnabled = true
        }
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if self.seconds < 1 {
            timer.invalidate()
            UIView.animate(withDuration: 1) {
                self.button1.backgroundColor = .red
                self.button2.backgroundColor = .red
                self.button3.backgroundColor = .red
                self.button4.backgroundColor = .red
                self.lastThreePeople.append(self.getName)
                self.lastThreeQuestions.append("Incorrect")
                self.longestStreak = 0
            }
            resetTimer()
            runTimer()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
                self.getImage()
            }
        } else {
            self.seconds-=1
            print(seconds)
        }
    }
    
    func setupStatButton() {
        statButton = UIButton(frame: CGRect(x: 340, y: 12, width: 30, height: 40))
        statButton.setImage(UIImage(named: "statsIcon"), for: .normal)
        statButton.addTarget(self, action: #selector(statButtonTapped), for: .touchUpInside)
        view.addSubview(statButton)
    }

    @objc func statButtonTapped() {
        timer.invalidate()
        performSegue(withIdentifier: "toStats", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStats" {
            let answer = segue.destination as! StatsViewController
            answer.lastAnswers = lastThreeQuestions
            answer.lastPeople = lastThreePeople
            answer.longestStreak = bestStreak
        }
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
