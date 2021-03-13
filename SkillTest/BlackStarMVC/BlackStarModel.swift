//
//  Model.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 10/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import Alamofire
import ProgressHUD

struct BlackStarModel {
    private let url: URL = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")!
    
     func loadCategories(completion: @escaping ([Category])->Void){
        ProgressHUD.animationType = .lineScaling
        ProgressHUD.show()
        AF.request(url).responseJSON { response in
                var categories: [Category] = []
                    if response.response?.statusCode != 200 {
                        ProgressHUD.showError("Ошибка получения товара")
                    } else {
                        if let objects = response.value,
                            let json = objects as? NSDictionary {
                            for (_, data) in json where data is NSDictionary {
                                if let category = Category(data: data as! NSDictionary)
                                { categories.append(category) }
                            }
                        }
                    }
                DispatchQueue.main.async {
                    ProgressHUD.dismiss()
                    completion(categories)
                }
            }
    }
}
