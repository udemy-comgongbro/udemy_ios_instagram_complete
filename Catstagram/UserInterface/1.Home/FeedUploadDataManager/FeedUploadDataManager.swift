//
//  FeedUploadDataManager.swift
//  Catstagram
//
//  Created by 노영재 on 2022/02/10.
//

import Alamofire

class FeedUploadDataManager {
    func feedUploadDataManager(_ viewController : HomeViewController, _ input : FeedUploadInput) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: input, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess, let result = result.result {
                    print(result.postIdx)
                } else {
                    print(result.message)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
