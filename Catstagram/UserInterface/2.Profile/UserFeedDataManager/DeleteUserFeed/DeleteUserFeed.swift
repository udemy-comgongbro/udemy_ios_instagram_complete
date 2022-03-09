//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by 김우성 on 2022/03/01.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
