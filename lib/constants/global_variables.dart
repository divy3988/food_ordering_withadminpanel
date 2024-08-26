// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';

String uri = 'http://10.0.2.2:8000';

String gpayjson = '''
{
    "provider": "google_pay",
    "data": {
      "environment": "TEST",
      "apiVersion": 2,
      "apiVersionMinor": 0,
      "allowedPaymentMethods": [
        {
          "type": "CARD",
          "tokenizationSpecification": {
            "type": "PAYMENT_GATEWAY",
            "parameters": {
              "gateway": "example",
              "gatewayMerchantId": "gatewayMerchantId"
            }
          },
          "parameters": {
            "allowedCardNetworks": ["VISA", "MASTERCARD"],
            "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
            "billingAddressRequired": true,
            "billingAddressParameters": {
              "format": "FULL",
              "phoneNumberRequired": true
            }
          }
        }
      ],
      "merchantInfo": {
        "merchantId": "01234567890123456789",
        "merchantName": "Example Merchant Name"
      },
      "transactionInfo": {
        "countryCode": "US",
        "currencyCode": "USD"
      }
    }
  }

''';

class globalvariable {
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}

final foods = [
  {'imageurl': 'assets/images/pizza.png'},
  {'imageurl': 'assets/images/chhole.png'},
  {'imageurl': 'assets/images/Malaikofta.png'},
  {'imageurl': 'assets/images/Manuchurian.png'},
  {'imageurl': 'assets/images/momos.png'},
  {'imageurl': 'assets/images/noodles.png'},
  {'imageurl': 'assets/images/palakpaneer.png'},
  {'imageurl': 'assets/images/paratha.png'},
  {'imageurl': 'assets/images/pasta.png'},
  {'imageurl': 'assets/images/pizza.png'}
];

final restaurants_count = [
  {'imageurl': 'assets/images/pizza.png'},
  {'imageurl': 'assets/images/momos.png'},
  {'imageurl': 'assets/images/noodles.png'},
  {
    'imageurl': 'assets/images/pizza.png',
  },
  {
    'imageurl': 'assets/images/pasta.png',
  },
  {
    'imageurl': 'assets/images/momos.png',
  },
  {
    'imageurl': 'assets/images/noodles.png',
  },
  {'imageurl': 'assets/images/chhole.png'},
  {'imageurl': 'assets/images/Malaikofta.png'},
  {'imageurl': 'assets/images/Manuchurian.png'},
  {'imageurl': 'assets/images/palakpaneer.png'},
  {'imageurl': 'assets/images/paratha.png'},
  {'imageurl': 'assets/images/pasta.png'},
  {'imageurl': 'assets/images/pizza.png'}
];
