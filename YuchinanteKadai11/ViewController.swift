//
//  ViewController.swift
//  
//  
//  Created by Yuchinante on 2024/03/27
//  
//

import UIKit

// PrefecturesViewControllerDelegateプロトコルを適用するViewControllerクラスを定義
class ViewController: UIViewController, PrefecturesViewControllerDelegate {
    // 都道府県名を表示するUILabelのインスタンスを宣言
    @IBOutlet weak var prefectureLabel: UILabel!

    // ユーザーがボタンをタップしたときに呼ばれるメソッド
    @IBAction func didTapSelectButton(_ sender: Any) {
        // Segueを実行し、"toPrefectureTableViewController"という識別子を持つ遷移を行う
        performSegue(withIdentifier: "toPrefectureTableViewController", sender: self)
    }

    // Segueが実行される直前に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segueの識別子が"toPrefectureTableViewController"である場合の処理
        if segue.identifier == "toPrefectureTableViewController" {
            // 遷移先がUINavigationControllerであることを確認し、その中のPrefecturesTableViewControllerにdelegateを設定する
            if let navigationController = segue.destination as? UINavigationController, let prefecturesTableViewController = navigationController.topViewController as? PrefecturesTableViewController {
                prefecturesTableViewController.delegate = self
            }
        }
    }

    // PrefecturesViewControllerDelegateプロトコルで定義されたメソッド。都道府県が選択された時に呼ばれ、都道府県名をUILabelに表示する
    func didSelectPrefectures(_ prefecture: String) {
        prefectureLabel.text = prefecture
    }

    // 戻るボタンがタップされたときに呼ばれるメソッド
    @IBAction func didTapBackButton(segue:UIStoryboardSegue){
        }
}

