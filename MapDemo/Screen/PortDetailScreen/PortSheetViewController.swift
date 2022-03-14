//
//  PortSheetViewController.swift
//  MapDemo
//
//  Created by dinh vien  on 24/02/2022.
//

import Foundation
import UIKit

class PortSheetViewController: BaseViewController{
    
    @IBOutlet weak var leftPortInfoTableView: PortDetailTableView!
    @IBOutlet weak var rightPortInfoTableView: PortDetailTableView!
    //    var leftPortInfoTableView = PortDetailTableView()
//    var rightPortInfoTableView = PortDetailTableView()

    var model: PortModel
    
    var leftData: [PortModel] = []
    var rightData: [PortModel] = []
    
    // MARK: - View lifecycle
    init(model: PortModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.config()
    }
    
    func config(){
//        self.configLeftTableView()
//        self.configRightTableView()
        
        
        let leftData = [PortService(image: "theme_thang_long", info: nil)]
        let rights = [PortService(image: "ptsc2", info: "1. Dàn đầu giếng (WHP) Thăng Long và Đông Đô"),
                      PortService(image: "ptsc3", info: "2. Cung cấp, vận hành, bảo dưỡng FPSO PTSC Lam Sơn"),
                      PortService(image: "ptsc4", info: "3. Khảo sát địa chất, khảo sát các công trình tịa mỏ"),
                      PortService(image: "ptsc5", info: "4. Tàu trực mỏ, tàu bảo vệ mỏ"),
                      PortService(image: "ptsc6", info: "5. Lắp đặt và bảo dưỡng các công trình tại mỏ"),
                      PortService(image: "ptsc7", info: "6. Dịch vụ căn cứ cảng dầu khí")]

        self.configData(leftData: leftData, rightData: rights)
    }
    
    func configLeftTableView(){
        self.view.addSubview(self.leftPortInfoTableView)
        self.leftPortInfoTableView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.bottom.equalToSuperview()
        })
    }
    
    func configRightTableView(){
        self.view.addSubview(self.rightPortInfoTableView)
        self.rightPortInfoTableView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.bottom.equalToSuperview()
        })
    }
    
    func configData(leftData: [PortService], rightData: [PortService]){
        self.leftPortInfoTableView.reloadData(data: leftData)
        self.rightPortInfoTableView.reloadData(data: rightData)
    }
}
