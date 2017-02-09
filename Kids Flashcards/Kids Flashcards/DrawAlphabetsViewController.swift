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
    
    var currentImageIndex : Int?
    var speechSynthesizer = AVSpeechSynthesizer()
    var speechString  : String?
    var speechUtterance : AVSpeechUtterance?
    var lastPoint : CGPoint = CGPoint.zero
    var swiped : Bool = false
    var opacity: CGFloat = 1.0
    
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
        
        )
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
    
    
    }
    
    @IBAction func eraser(_ sender: Any) {
        
    }
    
    @IBAction func colorSelector(_ sender: Any) {
        
        print("button clicked \((sender as AnyObject).restorationIdentifier)")
    }
   
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        
        if currentImageIndex! < 25 {
        
        currentImageIndex = currentImageIndex! + 1
        alphabetImageView.image = UIImage(named: "draw_letter_img_\(currentImageIndex!).png")
            
            speackWord(index: currentImageIndex!)
        }
    }
    
    @IBAction func previousButton(_ sender: Any) {
        if currentImageIndex != 0 {
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
