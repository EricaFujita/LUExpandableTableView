//
//  SecondViewController.swift
//  Test
//
//  Created by 藤田えりか on 2022/12/27.
//

import UIKit
import LUExpandableTableView

class SecondViewController: UIViewController , LUExpandableTableViewDataSource, LUExpandableTableViewDelegate {
    
    
    
    var expandableTableView = LUExpandableTableView()
    let question = ["草刈りについて","天候について","時期について"]
    let kusa = ["草刈機は必須ではありません","大体２時間ぐらいです"]
    let tenkou = ["雨天決行です","着替えを持ってきましょう","晴れると暑いです"]
    let jiki = ["夏は草刈りシーズンです"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandableTableView.frame = view.bounds
        view.addSubview(expandableTableView)
        
        expandableTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        expandableTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "CustomeHeader")
        
        expandableTableView.expandableTableViewDelegate = self
        expandableTableView.expandableTableViewDataSource = self
    }
    
    
    // セルの高さ
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //セクション間の高さ（隙間）
    func expandableTableView(_ expandableTableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    // セクションヘッダーの高さ
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        let header = CustomHeader()
        return header.setup(text: "セクションタイトル")
    }
    
    
    // セクション数
    func numberOfSections(in expandableTableView: LUExpandableTableView) -> Int {
        return question.count
    }
    
    // セル数
    func expandableTableView(_ expandableTableView: LUExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return kusa.count
        case 1:
            return tenkou.count
        default:
            return jiki.count
        }
        
    }
    
    // セルに表示するもの
    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = kusa[indexPath.row]
        case 1:
            cell.textLabel?.text = tenkou[indexPath.row]
        default:
            cell.textLabel?.text = jiki[indexPath.row]
        }
        
        return cell
    }
    
    // セクションに表示するもの
    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        guard let header = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomeHeader") as? CustomHeader else {
            return LUExpandableTableViewSectionHeader()
        }
        
        let _ = header.setup(text: question[section])
        return header
    }
}
