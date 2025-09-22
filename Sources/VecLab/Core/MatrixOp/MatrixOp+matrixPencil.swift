//
//  matrixPencil.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

extension MatrixOp {

    private func computeModelOrder(s: [Double], M: Int, L: Int) -> Int {

        let Mmax = 20 // Or whatever
        var Mnew = M
        if M < 0 {
            var ii = 0
            for i in 0..<L-1 {
                ii = i
                if log10(abs(s[i+1]/s[0])) < Double(M) {
                    break
                }
            }
            Mnew = min(ii, (L-1), Mmax)
            Mnew += 1
        }
        // let condition = s[0] / s[Mnew-1]

        return Mnew
    }

    private func computeAICForOrder(s: [Double], M: Int, N: Int, L: Int) -> Double {
        // AIC computation based on the provided MATLAB structure

        // This represents the likelihood estimate (related to the residuals).
        // Essentially, we're calculating the negative log-likelihood.
        let negativeLogLikelihood = -2.0 * Double(N) * log(s[M..<L].reduce(0, +))

        // This term represents the adjustment based on the model order.
        // In this case, the term 2*M accounts for the number of parameters in the model.
        let modelOrderPenalty = 2.0 * Double(N) * Double(L-M) * log(s[M..<L].reduce(0, +) / Double(L-M))

        // Summing the two parts together gives the AIC for the current model order.
        return negativeLogLikelihood + modelOrderPenalty
    }

    private func computeBICForOrder(s: [Double], M: Int, N: Int, L: Int) -> Double {
        // BIC computation

        // This represents the likelihood estimate (related to the residuals).
        // Essentially, we're calculating the negative log-likelihood.
        let negativeLogLikelihood = -2.0 * Double(N) * log(s[M..<L].reduce(0, +))

        // This term represents the adjustment based on the model order.
        // In the case of BIC, the penalty is larger than AIC. It is log(N) times the number of parameters.
        let modelOrderPenalty = Double(N) * Double(L-M) * log(s[M..<L].reduce(0, +) / Double(L-M))

        // Additional term specific to BIC which penalizes more complex models especially as sample size grows
        let bicSpecificPenalty = Double(M) * log(Double(N))

        // Combine the parts together to get the BIC for the current model order.
        return negativeLogLikelihood + modelOrderPenalty + bicSpecificPenalty
    }

    func optimalOrderUsingMDL(singularValues s: [Double], L: Int, N: Int) -> Int {
        var minMDLValue = Double.infinity
        var optimalOrder = 0

        for k in 0..<L {
            let mdlValue = computeMDLForOrder(s: s, order: k, L: L, N: N)
            if mdlValue < minMDLValue {
                minMDLValue = mdlValue
                optimalOrder = k
            }
        }
        return optimalOrder
    }

    private func computeMDLForOrder(s: [Double], order k: Int, L: Int, N: Int) -> Double {
        let remainingSingularValues = Array(s[k..<L])
        let logLikelihoodTerm = -Double(N) * remainingSingularValues.reduce(0.0, { $0 + log($1) })
        let estimatedVarianceTerm = Double(N) * Double(L - k) * log(remainingSingularValues.reduce(0.0, { $0 + $1 }) / Double(L - k))
        let modelComplexityTerm = Double(k * (2 * L - k)) * log(Double(N)) / 2.0
        return logLikelihoodTerm + estimatedVarianceTerm + modelComplexityTerm
    }

}
