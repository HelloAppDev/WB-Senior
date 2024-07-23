//
//  Font+Extension.swift
//  wb_client
//
//  Created by Мария Изюменко on 14.07.2024.
//

import SwiftUI

extension Font {
    static func montserratSemiBold(ofSize size: CGFloat) -> Font {
        return Font.custom("Montserrat-SemiBold", size: size)
    }
    
    static func montserratMedium(ofSize size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", size: size)
    }
    
    static func montserratRegular(ofSize size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
}
