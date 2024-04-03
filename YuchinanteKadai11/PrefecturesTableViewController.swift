//
//  PrefecturesTableViewController.swift
//  YuchinanteKadai11
//  
//  Created by Yuchinante on 2024/03/27
//  
//

import UIKit

// 都道府県選択画面からの通知を受け取るためのデリゲートプロトコル
protocol PrefecturesViewControllerDelegate: AnyObject {
    // 選択された都道府県名を通知するメソッド
    func didSelectPrefectures(_ prefecture: String)
}

// 都道府県一覧を表示するテーブルビューの管理を行うクラス
class PrefecturesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // デリゲートプロトコルへの参照を弱参照で保持する
    weak var delegate: PrefecturesViewControllerDelegate?

    // 表示する都道府県名のリスト
    private let prefecturesList = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県",
        "山形県", "福島県", "茨城県", "栃木県", "群馬県",
        "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県",
        "富山県", "石川県", "福井県", "山梨県", "長野県",
        "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県",
        "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
        "鳥取県", "島根県", "岡山県", "広島県", "山口県",
        "徳島県", "香川県", "愛媛県", "高知県", "福岡県",
        "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
        "鹿児島県", "沖縄県"
    ]

    // セクション内の行数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return prefecturesList.count
    }

    // セルの内容を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能なセルを取得して、都道府県名を表示する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = prefecturesList[indexPath.row]
        return cell
    }

    // テーブルビューの行が選択された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択された都道府県名を取得し、デリゲートに通知して画面を閉じる
        let selectedPrefecture = prefecturesList[indexPath.row]
        delegate?.didSelectPrefectures(selectedPrefecture)
        dismiss(animated: true, completion: nil)
    }
}
