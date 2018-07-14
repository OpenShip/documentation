# FedEx

## Client

Configure your client

```python
from openship.mappers.fedex import  FedexClient

fedexClient = FedexClient(
  "https://wsbeta.fedex.com:443/web-services",
  "FEDEX_USER_KEY",
  "FEDEX_PASSWORD",
  "FEDEX_ACCOUNT_NUMBER",
  "FEDEX_METER_NUMBER",
  "CARRIER_NAME"              # optional will be FeDex by default
)
```

## Proxy

Use the default proxy.

```python
from openship.mappers.fedex import FedexProxy

fedexProxy = FedexProxy(fedexClient)
```

## Quotes (Rate)

Use FedEx mapper and proxy to get quotes.

```python
from openship.domain.entities import Quote
from gds_helpers import jsonify

# JSON data

shipper = {"address": {"postal_code":"H3N1S4", "country_code":"CA"}}
recipient = {"address": {"city":"Lome", "country_code":"TG"}}
shipment_details = {"packages": [{"id":"1", "height":3, "lenght":10, "width":3,"weight":4.0}]}

# create domain quote request object from json
payload = Quote.create(shipper=shipper, recipient=recipient, shipment_details=shipment_details)

# get Fedex quote request xml object from payload
request = fedexProxy.mapper.create_quote_request(payload)

# request quotes from Fedex servers using the proxy
response = fedexProxy.get_quotes(request)

# extract domain response from Fedex quote response
quotes = fedexProxy.mapper.parse_quote_response(response)

print(jsonify(quotes))
# -->
'''
[
    [
        {
            "base_charge": 230.49,
            "carrier": "Fedex",
            "delivery_date": null,
            "delivery_time": null,
            "discount": 0.0,
            "duties_and_taxes": 0.0,
            "extra_charges": [
                {
                    "name": "FUEL",
                    "value": 9.22
                }
            ],
            "pickup_date": null,
            "pickup_time": null,
            "service_name": "INTERNATIONAL_PRIORITY",
            "service_type": "PAYOR_ACCOUNT_SHIPMENT",
            "total_charge": 239.71
        },
        {
            "base_charge": 207.47,
            "carrier": "Fedex",
            "delivery_date": null,
            "delivery_time": null,
            "discount": 0.0,
            "duties_and_taxes": 0.0,
            "extra_charges": [
                {
                    "name": "FUEL",
                    "value": 8.3
                }
            ],
            "pickup_date": null,
            "pickup_time": null,
            "service_name": "INTERNATIONAL_ECONOMY",
            "service_type": "PAYOR_ACCOUNT_SHIPMENT",
            "total_charge": 215.77
        }
    ],
    []
]
'''
```