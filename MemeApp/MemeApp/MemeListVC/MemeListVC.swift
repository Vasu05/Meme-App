//
//  MemeListVC.swift
//  MemeApp
//
//  Created by vasu on 05/11/18.
//  Copyright © 2018 Vasu. All rights reserved.
//

import UIKit

class MemeListVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var mTableView: UITableView!
    
    let identifier = "TbleCell"
    let identfier2 = "TableViewCelltsing"
    var memesDataSource:[MemeModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.delegate = self
        mTableView.dataSource = self
        
        regiterNib()
        // Do any additional setup after loading the view.
 
    }
    
    func regiterNib(){
        
        let CellNib = UINib.init(nibName: identifier, bundle: nil)
        mTableView.register(CellNib, forCellReuseIdentifier: identifier)
        //[UINib nibWithNibName:Identifier_MKGoldPriceTrendTblCell bundle:nil];
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
       

         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(addmeme))
        
        configureDataSource()
    }
    
    @objc func addmeme() {
        
        let MemeHomePageVC = storyboard?.instantiateViewController(withIdentifier:"MemeHomePageVC") as! MemeHomePageVC
        navigationController?.pushViewController(MemeHomePageVC, animated: true)
    }

    
    func configureDataSource(){
        
        var memes: [MemeModel]! {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }
        
        memesDataSource = memes
        mTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let tblcell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TbleCell
        
        let memeObj = memesDataSource![indexPath.row]
        
        tblcell.set(image: memeObj.memedImage ,memeTopText: memeObj.toptext ?? "", memeBottomText : memeObj.bottomText ?? "")
        return tblcell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memesDataSource?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension;
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
