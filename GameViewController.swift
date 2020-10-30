//
//  GameViewController.swift
//  Memory
//
//  Created by Ivana Fidanovska on 9/24/20.
//  Copyright © 2020 Fidanovska. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var model = CardModel()
    
    var setGame: Int?
    
    var lastFlippedCardIndex:IndexPath?
    
    var secondLastFlippedCardIndex:IndexPath?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewSetUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           if let setGame = setGame{
               model.getCards(withDifficulty: setGame )
           }
            model.shuffleCards()
        }
    
    //-MARK: Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return model.cards.count
            
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = model.cards[indexPath.row]
        cell.setCard(card)
            
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 18
        cell.layer.borderColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 1).cgColor
        cell.layer.backgroundColor = UIColor(red: 1, green: 0.84, blue: 0, alpha: 1).cgColor
            return cell
            
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
            
            let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            
            let card = model.cards[indexPath.row]
        
            
            if card.isFlipped == false {
                cell.flip()
                card.isFlipped = true
                
                if lastFlippedCardIndex == nil{
                    lastFlippedCardIndex = indexPath
                }else{
                    secondLastFlippedCardIndex = lastFlippedCardIndex
                    lastFlippedCardIndex = indexPath
                    if checkForMatches(withLastCard: lastFlippedCardIndex!, withSecondCard: secondLastFlippedCardIndex!){
                        lastFlippedCardIndex = nil
                        secondLastFlippedCardIndex = nil
                    }else{
                        collectionView.isUserInteractionEnabled = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            let card1 = self.model.cards[self.secondLastFlippedCardIndex!.row]
                            let card2 = self.model.cards[self.lastFlippedCardIndex!.row]
                            if let cellForCard2 = self.collectionView.cellForItem(at: self.secondLastFlippedCardIndex!) as? CardCollectionViewCell{
                                cellForCard2.flip()
                            }
                            
                            cell.flip()
                            card1.isFlipped = false
                            card2.isFlipped = false
                            self.lastFlippedCardIndex = nil
                            self.secondLastFlippedCardIndex = nil
                            collectionView.isUserInteractionEnabled = true
                        }
                    }
                }
                //TODO: - Proveri dali se matched
                
            }
        }
        // return true if matches, false otherwise
        func checkForMatches(withLastCard lastCard: IndexPath, withSecondCard seconCard: IndexPath) -> Bool{
            let card1 = model.cards[lastCard.row]
            let card2 = model.cards[seconCard.row]
            if card1.imageName == card2.imageName{
                if checkForWin(){
                    print("WIN!")
                   
                    showAlert()
                    
                }

                return true
            }
            return false
        }
    
    func collectionViewSetUp(){
        collectionView.layer.cornerRadius = 32
        collectionView.layer.borderWidth = 12
        collectionView.layer.borderColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 1).cgColor
    }
    
    //-MARK: Alert
        
    func showAlert(){
        
        let alertController = UIAlertController(title: "BOO!", message: "You did It!", preferredStyle: .alert)
        
        let subview = (alertController.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
       let shapes = UIView()
        shapes.layer.cornerRadius = 61
        shapes.layer.borderWidth = 10
        shapes.layer.borderColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 1).cgColor
        
        subview.layer.shadowColor = UIColor(red: 0.086, green: 0.063, blue: 0.345, alpha: 1).cgColor
        subview.layer.shadowOpacity = 1
        subview.layer.shadowRadius = 27
        subview.layer.shadowOffset = CGSize(width: 8, height: 10)
        subview.layer.backgroundColor = UIColor(red: 0.942, green: 0.226, blue: 0, alpha: 1).cgColor
        
        
            
            alertController.addAction(UIAlertAction(title: "Start again", style: UIAlertAction.Style.default)
            
            { action -> Void in
               
                self.dismiss(animated: true, completion: nil)
            })
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        func checkForWin() -> Bool{
            for i in model.cards{
                if !i.isFlipped{
                    return false
                }
            }
            return true
        }
    
    //-MARK: Button Action
    
    
    @IBAction func homeActionButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}


