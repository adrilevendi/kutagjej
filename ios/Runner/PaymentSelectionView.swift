//
//  PaymentSelectionView.swift
//  Runner
//
//  Created by Adri3 on 18.6.24.
//

import Foundation
extension ViewController: PaymentFlowSessionDelegate {
    func paymentFormComplete(_ result: Result<PaymentFormResult, Error>) {
        switch result {
        case .success(let result):
            // result.isCardSaveOn: Bool
            // result.token: String
            // result.paymentMethod: PaymentMethodType (creditCard, paypal)
            switch result.paymentMethod {
                case .creditCard:
                    /// make 2Checkout API call to create an order with the received token
                    /// https://app.swaggerhub.com/apis-docs/2Checkout-API/api-rest_documentation/6.0#/Order/post_orders_
                    /// If the create order response includes payment details with the "Authorize3DS" field,
                    /// you can authorize the 3DS payment using the Verifone2COPaymentForm.authorizePayment method.
                    /// This method takes three parameters: webConfig, delegate, and from.
                    let webConfig = VFWebConfig(url: "URL",
                                                    parameters: ["Required parameters"],
                                                    expectedRedirectUrl: ["expectedReturnURL"],
                                                    expectedCancelUrl: ["expectedCancelURL"])
                    Verifone2COPaymentForm.authorizePayment(webConfig: webConfig, delegate: self, from: self)
                case .paypal:
                    /// make 2Checkout API call to create an order with type Paypal
                    /// https://app.swaggerhub.com/apis-docs/2Checkout-API/api-rest_documentation/6.0#/Order/post_orders_
                    /// authorize a PayPal payment using the Verifone2COPaymentForm.authorizePayment method,
                    /// you will need to use the redirect URL that was returned in the create order response.
                    let webConfig = VFWebConfig(url: "RedirectURL",
                                                    parameters: ["Required parameters"],
                                                    expectedRedirectUrl: ["expectedReturnURL"],
                                                    expectedCancelUrl: ["expectedCancelURL"])
                    Verifone2COPaymentForm.authorizePayment(webConfig: webConfig, delegate: self, from: self)
            }
            
        case .failure(let error):
            // Verifone2CoError
            print("Payment failed with error: \(error)")
        }
    }

    func paymentFormWillShow() {
        /// Handle payment form being displayed
        print("Payment form will be displayed")
    }
    
    func paymentFormWillClose() {
        /// Handle payment form being hidden
        print("Payment form will be hidden")
    }

    func paymentMethodSelected(_ paymentMethod: PaymentMethodType) {
        /// Handle payment method selection
        print("Selected payment method: \(paymentMethod)")
    }
}
