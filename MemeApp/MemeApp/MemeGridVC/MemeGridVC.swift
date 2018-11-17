//
//  MemeGridVC.swift
//  MemeApp
//
//  Created by vasu on 05/11/18.
//  Copyright © 2018 Vasu. All rights reserved.
//

import UIKit
import Photos

class MemeGridVC: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var mCollectionView : UICollectionView!
    
    let identifier = "CltnCell"
    var memesDataSource:[MemeModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        self.registerNib()
        
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
    
    func registerNib()  {
        
        let nib = UINib(nibName: identifier, bundle: nil)
        mCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func configureDataSource(){
        
        var memes: [MemeModel]! {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }
        
        memesDataSource = memes
        mCollectionView.reloadData()
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cltnCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CltnCell
        
        let memeobj = memesDataSource![indexPath.row]
        
        cltnCell.set(image: memeobj.memedImage, memeTopText: memeobj.toptext ?? "", memeBottomText: memeobj.bottomText ?? "")
        
        return cltnCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memesDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize.init(width: self.view.frame.width/2 - 32, height: 156)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let obj = memesDataSource![indexPath.row]
        
        let memeDetailVC = storyboard?.instantiateViewController(withIdentifier: "MemeDetailsVC") as! MemeDetailsVC
        
        navigationController?.pushViewController(memeDetailVC, animated: true)
        memeDetailVC.pImage = obj.memedImage
        
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
