//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 노영재 on 2022/02/10.
//

struct FeedUploadModel : Decodable {
    var isSuccess: Bool
    var code : Int
    var message: String
    var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
}
