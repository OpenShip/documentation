# Quotes (Rate)

Use a proxy and it's mapper to get a carrier quote.

```python
from purplship.domain.entities import Quote
from gds_helpers import jsonify

# JSON data

shipper = {"address": {"postal_code":"H3N1S4", "country_code":"CA"}}
recipient = {"address": {"city":"Lome", "country_code":"TG"}}
shipment_details = {"packages": [{"id":"1", "height":3, "lenght":10, "width":3,"weight":4.0}]}

# create a domain quote payload entity from the json data
# this operation will also validate the data
quote_payload = Quote.create(shipper=shipper, recipient=recipient, shipment_details=shipment_details)

# get a carrier quote request xml object from the quote payload
request = proxy.mapper.create_quote_request(quote_payload)

# send a quote request to the carrier servers using the proxy
response = proxy.get_quotes(request)

# extract the domain quote entity from the carrier quote response
quotes = proxy.mapper.parse_quote_response(response)
```

```python
print(jsonify(quotes))
# -->
'''
[
    [
        {
            "base_charge": 230.49,
            "carrier": "carrier",
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
            "carrier": "carrier",
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