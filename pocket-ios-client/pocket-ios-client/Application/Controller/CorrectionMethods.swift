//
//  CorrectionMethods.swift
//  pocket-ios-client
//
//  Created by Мак on 30/12/2018.
//  Copyright © 2018 Damien Inc. All rights reserved.
//

import Foundation

class CorrectionMethods {
    func autoLogIn() {
        let selfInfo = DataBase().loadSelfUser()
        NetworkServices.login(accountName: selfInfo.accountName, password: selfInfo.password) { (token) in
            if token != "" {
                Token.token = token
            } else {
                self.logOut()
            }
        }
    }
    
    func logOut() {
        Token.token = nil
        AdaptationDBJSON().deleteAllRecords()
        ApplicationSwitcherRC.initVC(choiceVC: .login)
    }
}