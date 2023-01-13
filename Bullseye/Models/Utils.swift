//
//  Utils.swift
//  Bullseye
//
//  Created by Luis Alfredo Becerra Jaime on 10/01/23.
//

import Foundation
import UIKit

func formatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YY/MM/dd HH:mm"
    return formatter.string(from: date)
}
