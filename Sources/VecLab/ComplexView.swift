//
//  ComplexView.swift
//  PhaseMeter
//
//  Created by Marcus Painter on 08/04/2025.
//

import SwiftUI

struct ComplexView: View {

    init() {

        let a = Complex(1, 2)
        let b = Complex(-1, -2)
        let c = a + b
        //print(c)
        
        let q = 1.0 + 10.j
        print(q)
        
        let z = ComplexArray([1,2,3], [1,2,3])
        let t = z.firstIndex(where: { $0.real < 10} )
        let t2 = z.indices(where: { $0.real < 3} )
        print(t2)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ComplexView()
}
