//  web3swift
//
//  Created by Alex Vlasov.
//  Copyright © 2018 Alex Vlasov. All rights reserved.
//

import Foundation

@objc(Web3HttpProvider)
final class _ObjCWeb3HttpProvider: NSObject{
    private (set) var web3Provider: Web3HttpProvider?
    
    init(providerURL: NSURL, network: _ObjCNetwork, keystoreManager: _ObjCKeystoreManager){
        let network = Networks.fromInt(network.networkID)
        guard let ks = keystoreManager.keystoreManager else {return}
        self.web3Provider = Web3HttpProvider(providerURL as URL, network: network, keystoreManager: ks)
    }
    
    init(web3Provider: Web3HttpProvider) {
        self.web3Provider = web3Provider
    }
}

@objc(Network)
final class _ObjCNetwork: NSObject {
    let networkID: Int
    
    init(networkID: Int) {
        self.networkID = networkID
    }
}
