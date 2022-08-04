//
//  ViewController.swift
//  SideMenuApp
//
//  Created by 住田雅隆 on 2022/03/23.
//

import UIKit

class SideMenuController: UIViewController {
    //セクションのタイトルを定義
    let sectionTitle: NSArray = ["フルーツ", "野菜"]
    let fruits = ["バナナ","メロン","キウイ"]
    let vegetable = ["玉ねぎ","大根","ニンジン"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    //セクション数の指定
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    //セクションタイトルを指定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    //それぞれのセルの表示数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruits.count
        }
        else if section == 1 {
            return vegetable.count
        }
        else {
            return 0
    }
}
    //それぞれのセルに表示される内容を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = fruits[indexPath.row]
        if indexPath.section == 0 {
            cell.textLabel?.text = fruits[indexPath.row]
            //セルの色を指定
            cell.textLabel?.textColor = UIColor.red
            //セルのフォントを指定
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = vegetable[indexPath.row]
            cell.textLabel?.textColor = UIColor.blue
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        }
        return cell
    }
}
