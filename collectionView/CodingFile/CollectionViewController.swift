//
//  collectionViewController.swift
//  collectionView
//
//  Created by R90 on 01/01/18.
//

import UIKit
struct BankAccountDetail {
    var bankName: String
    var accountNumber: Int
    var isSavingAccount: Bool
}

struct FoodItem {
    var name: String
    var price: Int
    var discountedPrice: Int
}
class CollectionViewController: UIViewController {
    
    
    @IBOutlet weak var bankAccountLimitartion: UICollectionView!
    var arrBankAccountDetail: [BankAccountDetail] = []
    var numberOfRowInItem: Int = 3
    var spaceInDetail: CGFloat = 16
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        configerCatagoryCollection()
        loadBankAccountDetail()
    }
    
    private func loadBankAccountDetail() {
        let karnBhai : BankAccountDetail = BankAccountDetail(bankName: "HDFC", accountNumber: 086421357901, isSavingAccount: true)
        arrBankAccountDetail = [karnBhai ,karnBhai,karnBhai,karnBhai,karnBhai]
    }
    
    private func configerCatagoryCollection() {
        bankAccountLimitartion.register(UINib(nibName: "FoodItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodItemCollectionViewCell")
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBankAccountDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BankAccountCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankAccountCollectionViewCell", for: indexPath) as! BankAccountCollectionViewCell
        let bankAccount = arrBankAccountDetail[indexPath.row]
        cell.nameLable.text = "ayush"
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}

