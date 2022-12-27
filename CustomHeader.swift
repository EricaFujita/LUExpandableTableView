//
//  CustomHeader.swift
//  Test
//
//  Created by 藤田えりか on 2022/12/27.
//

import Foundation
import LUExpandableTableView
class CustomHeader: LUExpandableTableViewSectionHeader {
    
    var label = UILabel()
    var button = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isExpanded: Bool {
        didSet {
            self.button.setTitle(isExpanded ? "閉じる" : "開く", for: .normal)
        }
    }
    
    func setup(text: String) -> CGFloat {
        
        backgroundView = UIImageView()
        
        backgroundView?.backgroundColor = UIColor.init(red: 149/255, green: 210/255, blue: 107/255, alpha: 1)
        
        label.frame = CGRect(x: 10, y: 0, width:UIScreen.main.bounds.size.width*0.8,  height: 100)
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(label)
        
        button.frame = CGRect(x: label.frame.width, y: 0, width: UIScreen.main.bounds.size.width*0.2, height: 100)
        button.setTitle(isExpanded ? "閉じる" : "開く", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(onOpen(sender:)), for: .touchUpInside)
        addSubview(button)
        
        return button.frame.origin.y + button.frame.height
    }
    
    @objc func onOpen(sender: UIButton) {
        delegate?.expandableSectionHeader(self, shouldExpandOrCollapseAtSection: section)
    }
}
