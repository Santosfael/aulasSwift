//
//  HeroViewModelDelegate.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 31/03/22.
//

import Foundation
import UIKit

protocol HeroViewModelDelegate: AnyObject {
    
    func heroFetchWithSucess()
    func errorToFetchHero(_ error: String)
}
