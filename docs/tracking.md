# Tracking

Use a proxy, and it's mapper get trackings.

```python
from purplship.domain.entities import Tracking

# JSON data
tracking_numbers = ["7740842550", "1815115363"]

# create a domain tracking payload entity from the json data
# this operation will also validate the data
tracking_payload = Tracking.create(tracking_numbers=tracking_numbers)

# get a carrier tracking request xml object from the tracking payload
tracking_request = proxy.mapper.create_tracking_request(tracking_payload)

# send a tracking request to the carrier servers using the proxy
response = proxy.get_trackings(tracking_request)

# extract the domain tracking entity from the carrier tracking response
trackings = proxy.mapper.parse_tracking_response(response)
```

```python
print(jsonify(trackings))
# -->
'''
[
    [
        {
            "carrier": "carrier_name",
            "events": [
                {
                    "code": "PU",
                    "date": "2009-08-26",
                    "description": "Shipment picked up",
                    "location": "Singapore - Singapore ",
                    "signatory": "",
                    "time": "10:00:00"
                }
            ],
            "shipment_date": "2009-08-26 10:00:00",
            "tracking_number": "7740842550"
        },
        {
            "carrier": "carrier_name",
            "events": [
                {
                    "code": "PU",
                    "date": "2009-08-13",
                    "description": "Shipment picked up",
                    "location": "Hong Kong - Hong Kong ",
                    "signatory": "",
                    "time": "23:58:00"
                },
                {
                    "code": "RW",
                    "date": "2009-08-14",
                    "description": "",
                    "location": "Hong Kong - Hong Kong ",
                    "signatory": "21.20",
                    "time": "02:19:50"
                }
            ],
            "shipment_date": "2009-08-13 23:58:00",
            "tracking_number": "1815115363"
        }
    ],
    []
]
'''
```