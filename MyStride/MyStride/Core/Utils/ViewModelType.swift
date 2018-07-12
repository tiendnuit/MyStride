//
//  ViewModelType.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
