//
//  DrawAlphabetsViewController.swift
//  Kids Flashcards
//
//  Created by Saqlain-PC on 2/9/17.
//  Copyright © 2017 Saqlain-PC. All rights reserved.
//

import UIKit
import AVFoundation
import CoreGraphics

class DrawAlphabetsViewController: UIViewController {
    
    
    @IBOutlet weak var alphabetImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    var currentImageIndex : Int?
    
    var lastPoint : CGPoint = CGPoint.zero
    var swiped : Bool = false
    var opacity: CGFloat = 1.0
    var lineWidth : CGFloat = 12.0
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    
    var speechSynthesizer = AVSpeechSynthesizer()
    var speechString  : String?
    var speechUtterance : AVSpeechUtterance?
    
    let alphabetArray : Array = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        currentImageIndex = 0
        alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
        let string = alphabetArray[currentImageIndex!]
        speackWord(string: string)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //MARK: Touches Delegates
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = false
        if let touch = touches.first  {
            lastPoint = touch.location(in: self.tempImageView)
        }
 
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         swiped = true
        if let touch = touches.first  {
            let currentPoint = touch.location(in: self.tempImageView)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !swiped {
            // draw a single point
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
        UIGraphicsBeginImageContext(tempImageView.frame.size)
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.tempImageView.frame.size.width , height: self.tempImageView.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
    func drawLineFrom(fromPoint : CGPoint , toPoint : CGPoint) {
        
        UIGraphicsBeginImageContext(self.tempImageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.tempImageView.frame.size.width , height: self.tempImageView.frame.size.height))
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(red: red/255, green: green/255, blue: blue/255, alpha: opacity)
        context?.setBlendMode(CGBlendMode.normal)
        context?.strokePath()
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    

    //MARK: IBAction methods
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func readLetter(_ sender: Any) {
        
        let string = alphabetArray[currentImageIndex!]
        speackWord(string: string)
    
    }
    
    @IBAction func phonicLetter(_ sender: Any) {
        
        let string = alphabetArray[currentImageIndex!]
        speackWord(string: string)
    }
    
    @IBAction func eraser(_ sender: Any) {
        tempImageView.image = nil
        
    }
    
    @IBAction func colorSelector(_ sender: Any) {
        
    let colorString = ((sender as AnyObject).restorationIdentifier!)! as String
        
        
        switch colorString {
        
        case "redColor":
            self.red = 255.0
            self.green = 0.0
            self.blue = 0.0
            
        case "orangeColor":
            self.red = 255.0
            self.green = 128.0
            self.blue = 0.0
            
        case "greenColor":
            self.red = 0.0
            self.green = 255.0
            self.blue = 0.0
            
        case "blueColor":
            self.red = 0.0
            self.green = 0.0
            self.blue = 255.0
            
        case "blackColor":
                self.red = 0.0
                self.green = 0.0
                self.blue = 0.0
        default:
            self.red = 0.0
            self.green = 0.0
            self.blue = 0.0
            
        }
  
    }
   
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        
        if currentImageIndex! < 25 {
        tempImageView.image = nil
        currentImageIndex = currentImageIndex! + 1
        alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            
            let string = alphabetArray[currentImageIndex!]
            speackWord(string: string)
            
        }
        else {
            tempImageView.image = nil
            currentImageIndex = 0
            alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            
            let string = alphabetArray[currentImageIndex!]
            speackWord(string: string)
        }
        
        
    }
    
    @IBAction func previousButton(_ sender: Any) {
        if currentImageIndex != 0 {
            tempImageView.image = nil
            currentImageIndex = currentImageIndex! - 1
            alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            let string = alphabetArray[currentImageIndex!]
            speackWord(string: string)
        }
        else{
            tempImageView.image = nil
            currentImageIndex = 25
            alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            let string = alphabetArray[currentImageIndex!]
            speackWord(string: string)
        }
    }
    
    func speackWord(string : String){
        
       speechString = string
        speechUtterance = AVSpeechUtterance(string: speechString!)
        speechSynthesizer.speak(speechUtterance!)
    }
    
  

}
