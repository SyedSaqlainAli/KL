//
//  ABCFlashcardsViewController.swift
//  Kids Flashcards
//
//  Created by Saqlain-PC on 2/9/17.
//  Copyright © 2017 Saqlain-PC. All rights reserved.
//

import UIKit
import AVFoundation

class ABCFlashcardsViewController: UIViewController {
    
    var speechSynthesizer = AVSpeechSynthesizer()
    var speechString  : String?
    var speechUtterance : AVSpeechUtterance?
    var editButtonStatus = true
    
    
    let smallAlphabetArray : Array = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    
    @IBOutlet weak var alphabetLablel: UILabel!
    
    @IBOutlet weak var objectImageView: UIImageView!
    
    @IBOutlet weak var wordCardImage: UIImageView!
    @IBOutlet weak var wordCardLabel: UILabel!
    @IBOutlet weak var wordCardString: UILabel!
    @IBOutlet weak var editButtonOutlet: UIButton!
    @IBOutlet weak var eraserButtonOutlet: UIButton!
    

    var currrentAlphabetIndex : Int?
    var string : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currrentAlphabetIndex = 0
         speechSynthesizer = AVSpeechSynthesizer()
        eraserButtonOutlet.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {

        string = smallAlphabetArray[currrentAlphabetIndex!]
        alphabetLablel.text = (string?.uppercased())!+string!
        wordCardLabel.text = " " + (string?.uppercased())!
        speackWord(string: string!)
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func speakLetter(_ sender: Any) {
    }
    @IBAction func phonic(_ sender: Any) {
    }
   
    @IBAction func edit(_ sender: Any) {
       
        if editButtonStatus {
        
        eraserButtonOutlet.isHidden = false
        let image = UIImage(named: "draw_clear.png")
        editButtonOutlet.setImage(image, for: .normal)
        editButtonStatus = false
            
        }else{
            
            eraserButtonOutlet.isHidden = true
            let image = UIImage(named: "letter_draw.png")
            editButtonOutlet.setImage(image, for: .normal)
            editButtonStatus = true
        }
        
    }
    
    @IBAction func eraser(_ sender: Any) {
    }
    

    @IBAction func nextButton(_ sender: Any) {
        
        if currrentAlphabetIndex! < 25 {
           
            currrentAlphabetIndex = currrentAlphabetIndex! + 1
            string = smallAlphabetArray[currrentAlphabetIndex!]
            alphabetLablel.text = (string?.uppercased())!+string!
            wordCardLabel.text = " " + (string?.uppercased())!
            speackWord(string: string!)
            
            
        }
        else {
            
            currrentAlphabetIndex = 0
            string = smallAlphabetArray[currrentAlphabetIndex!]
            alphabetLablel.text = (string?.uppercased())!+string!
            wordCardLabel.text = " " + (string?.uppercased())!
            speackWord(string: string!)
        }
        
        
    }
    
    @IBAction func previousButton(_ sender: Any) {
    
        if currrentAlphabetIndex != 0 {
            
            currrentAlphabetIndex = currrentAlphabetIndex! - 1
            string = smallAlphabetArray[currrentAlphabetIndex!]
            alphabetLablel.text = (string?.uppercased())!+string!
            wordCardLabel.text = " " + (string?.uppercased())!
            speackWord(string: string!)
        }
        else{
            
            currrentAlphabetIndex = 25
            string = smallAlphabetArray[currrentAlphabetIndex!]
            alphabetLablel.text = (string?.uppercased())!+string!
            wordCardLabel.text = " " + (string?.uppercased())!
            speackWord(string: string!)
        }
        
    }
    
    func speackWord(string : String){

        speechString = string
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
