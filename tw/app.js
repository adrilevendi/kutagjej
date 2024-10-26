const express = require('express');

const app = express();
port = 3000;

const Twocheckout = require("twocheckout");
const config = {
    sellerId: "255244469173", // REQUIRED
    secretKey: "t)[5w(c?RG=&O^4vk8~y", // REQUIRED
};

const tco = new Twocheckout(config);

// app.use(Cors());
const paymentOrderSuccessPayload = {
    Country: "us",
    Currency: "USD",
    CustomerIP: "91.220.121.21",
    ExternalReference: "REST_API_AVANGTE",
    Language: "en",
    Source: "testAPI.com",
    BillingDetails: {
        Address1: "Test Address",
        City: "LA",
        State: "California",
        CountryCode: "US",
        Email: "testcustomer@2Checkout.com",
        FirstName: "Customer",
        LastName: "2Checkout",
        Zip: "12345",
    },
    Items: [
        {
            Name: "Dynamic product",
            Description: "Test description",
            Quantity: 1,
            IsDynamic: true,
            Tangible: false,
            PurchaseType: "PRODUCT",
            CrossSell: {
                CampaignCode: "CAMPAIGN_CODE",
                ParentCode: "MASTER_PRODUCT_CODE",
            },
            Price: {
                Amount: 100,
                Type: "CUSTOM",
            },
            PriceOptions: [
                {
                    Name: "OPT1",
                    Options: [
                        {
                            Name: "Name LR",
                            Value: "Value LR",
                            Surcharge: 7,
                        },
                    ],
                },
            ],
            RecurringOptions: {
                CycleLength: 2,
                CycleUnit: "DAY",
                CycleAmount: 12.2,
                ContractLength: 3,
                ContractUnit: "DAY",
            },
        },
    ],
    PaymentDetails: {
        Type: "TEST",
        Currency: "USD",
        CustomerIP: "91.220.121.21",
        PaymentMethod: {
            CardNumber: "4000000000000002",
            CardType: "MASTERCARD",
            Vendor3DSReturnURL: "www.success.com",
            Vendor3DSCancelURL: "www.fail.com",
            ExpirationYear: "2028",
            ExpirationMonth: "12",
            CCID: "123",
            HolderName: "John Doe",
            RecurringEnabled: true,
            HolderNameTime: 1,
            CardNumberTime: 1,
        },
    },
};



app.get("/api/order", (req, resp) => {
   

    tco.order().create(paymentOrderSuccessPayload, (err, res) => {
        if (err) {
            console.log("Error placing payment with callback!");
            console.error(err);
            resp.json({
                success: true,
                message: err
            });
            

        } else if (res) {
            console.log("Created order with RefNo: " + res.RefNo);
            tco.order().retrieve({ RefNo: res.RefNo }, (err, res) => {
                if ("RefNo" in res) {
                    console.log("Retrieved order RefNo: %s", res.RefNo);
                    resp.json({
                        success: true,
                        message: "Retrieved order RefNo: %s"+ res.RefNo
                    });
                } else {
                    console.error(err);
                    resp.json({
                        success: true,
                        message: err
                    });
                    
                }
            });
        }
    });
});

app.listen(port, () => {console.log(`server is running on port ${port}`)})