# Overview

!!! warning
    This documentation page is a **work in progress!**
    

PurplShip is a system for connecting multiple supply chain carriers API.

In addition to providing a unified and simplified interface across logistics carriers APIs, PurplShip offers a framework to facilitate the full access of advanced and specific carriers capabilities while simplifying the addition of new carrier APIs.

With PurplShip you can:

- Integrate multiple carriers web services: DHL, FedEx, UPS, USPS, Canada Post and more with ease
- Use a modern and intuitive, unified API across carriers


The library is the foundation of a framework that streamline the integration for any shipping carrier.

!!! info
    PurplShip is has several modules
    
    - `purplship.package` 
    
    _Dedicated to carriers courier and package services integration._
    
    - `purplship.freight` (Currently in development)
    
    _Dedicated to carriers Freight (LTL, FTL...) services integration._
    
    - `purplship.document` (On the Roadmap)
    
    _Dedicated to carriers document services (BOL, Procurements...) integration._


## Getting Started with **PurplShip Package**


### Installation

```shell
pip install -f https://git.io/purplship purplship.package==2020.4.1
```

### Quick Start

```python
import purplship.package as api

canadapost = api.gateway["canadapost"].create(
    {
        "username": "site_id",
        "password": "password",
        "customer_number": "123456789",
        "carrier_name": "canadapost_express_test",
        "test": True
    }
)

request = api.rating.fetch({
    "shipper": {
        "postalCode": "V6M2V9",
        "city": "Vancouver",
        "countryCode": "CA",
        "stateCode": "BC",
        "addressLine1": "5840 Oak St"
    },
    "recipient": {
        "postalCode": "E1C4Z8",
        "city": "Moncton",
        "countryCode": "CA",
        "stateCode": "NB",
        "residential": False,
        "addressLine1": "125 Church St"
    },
    "parcel": {"height": 3.0, "length": 6.0, "width": 3.0, "weight": 0.5},
    "services": ["canadapost_priority"]
})

rates = request.from_(canadapost).parse()
```

```python
from purplship.core.utils import to_dict

print(to_dict(rates))
```

??? success "Output"
    ```json
    [
      [],
      [
          {
            "baseCharge": 101.83,
            "carrier": "canadapost",
            "carrierName": "CanadaPost",
            "currency": "CAD",
            "discount": -3.63,
            "dutiesAndTaxes": 14.73,
            "estimatedDelivery": "2020-05-06",
            "extraCharges": [
              {
                "amount": 8.11,
                "currency": "CAD",
                "name": "Fuel surcharge"
              },
              {
                "amount": -11.74,
                "currency": "CAD",
                "name": "SMB Savings"
              }
            ],
            "id": "da75bd1d-caf6-4e1a-8362-7e6e3e7e75d8",
            "service": "canadapost_priority",
            "totalCharge": 112.93
          }
        ]
    ]
    ```
