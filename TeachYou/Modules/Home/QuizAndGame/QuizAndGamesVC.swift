//
//  QuizAndGamesVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class QuizAndGamesVC: UIViewController {

    @IBOutlet weak var collectionGame: UICollectionView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension QuizAndGamesVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionGame.dequeueReusableCell(withReuseIdentifier: "QuizAndGameCVCell", for: indexPath as IndexPath) as! QuizAndGameCVCell
        if indexPath.row == 0{
            
            cell.imgGame.image = UIImage(named: "watercraftrush")
            
        }else if indexPath.row == 1 {
            
            cell.imgGame.image = UIImage(named: "word")
        } else if indexPath.row == 2 {
            cell.imgGame.image = UIImage(named: "ChessSet")
        }else if indexPath.row == 3 {
            cell.imgGame.image = UIImage(named: "Tic-Tac-Toe")
        }else if indexPath.row == 4 {
            cell.imgGame.image = UIImage(named: "bionic")
        }else {
            cell.imgGame.image = UIImage(named: "cross")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/watercraft/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        }else if indexPath.row == 1 {
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/wordsearch/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        } else if indexPath.row == 2 {
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/chess/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        }else if indexPath.row == 3 {
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/tictactoe/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        }else if indexPath.row == 4 {
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/bionic/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        }else {
            let quizAndGameWebViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizAndGameWebViewVC") as! QuizAndGameWebViewVC
            quizAndGameWebViewVC.strWebViewUrl = "https://community.teachyou.in/games1/sudoku/"
            self.navigationController?.pushViewController(quizAndGameWebViewVC, animated: true)

        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
}
