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
    var speechSynthesizer = AVSpeechSynthesizer()
    var speechString  : String?
    var speechUtterance : AVSpeechUtterance?
    var lastPoint : CGPoint = CGPoint.zero
    var swiped : Bool = false
    var opacity: CGFloat = 1.0
    var lineWidth : CGFloat = 12.0
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    
    let alphabetArray : Array = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        currentImageIndex = 0
        alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
        speackWord(index: currentImageIndex!)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //MARK: Touches Delegates
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = false
        if let touch = touches.first! as? UITouch {
            lastPoint = touch.location(in: self.view)
        }
 
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         swiped = true
        if let touch = touches.first! as? UITouch {
            let currentPoint = touch.location(in: self.view)
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
        
        UIGraphicsBeginImageContext(view.frame.size)
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
    func drawLineFrom(fromPoint : CGPoint , toPoint : CGPoint) {
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
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
        
        speechString = alphabetArray[currentImageIndex!] as String
        speechUtterance = AVSpeechUtterance(string: speechString!)
        speechSynthesizer.speak(speechUtterance!)
    
    }
    
    @IBAction func phonicLetter(_ sender: Any) {
        
        speechString = alphabetArray[currentImageIndex!] as String
        speechUtterance = AVSpeechUtterance(string: speechString!)
        speechSynthesizer.speak(speechUtterance!)
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
            
            speackWord(index: currentImageIndex!)
            print(currentImageIndex)
        }
        else {
            tempImageView.image = nil
            currentImageIndex = 0
            alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            print(currentImageIndex)
            speackWord(index: currentImageIndex!)
        }
        
        
    }
    
    @IBAction func previousButton(_ sender: Any) {
        if currentImageIndex != 0 {
            tempImageView.image = nil
            currentImageIndex = currentImageIndex! - 1
            alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            speackWord(index: currentImageIndex!)
        }
    }
    
    func speackWord(index : Int){
        speechString = alphabetArray[index] as String
        speechUtterance = AVSpeechUtterance(string: speechString!)
        speechSynthesizer.speak(speechUtterance!)
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
