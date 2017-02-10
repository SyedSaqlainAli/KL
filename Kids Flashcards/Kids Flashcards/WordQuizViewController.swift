//
//  WordQuizViewController.swift
//  Kids Flashcards
//
//  Created by Saqlain-PC on 2/9/17.
//  Copyright © 2017 Saqlain-PC. All rights reserved.
//

import UIKit

class WordQuizViewController: UIViewController {

    
    @IBOutlet weak var quizName: UIButton!
    
    var imagesRandomIteration :Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func readLetter(_ sender: Any) {
        
        
    }
    
    @IBAction func imageOne(_ sender: Any) {
        
    }
    
    @IBAction func imageTwo(_ sender: Any) {
        
    }
    @IBAction func imageThree(_ sender: Any) {
    
    }
    
    @IBAction func imageFour(_ sender: Any) {
    
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
