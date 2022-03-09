//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by 노영재 on 2022/02/10.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ viewController: HomeViewController, _ parameters : FeedInput) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
