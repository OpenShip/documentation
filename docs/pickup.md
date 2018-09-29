# Pickup

## Pickup booking

Use a proxy, and it's mapper to book a pickup.

```python
from purplship.domain.entities import Pickup

# JSON data
data = {
    "date": "2013-10-19",
    "account_number": "123456789",
    "pieces": 2,
    "weight": 20,
    "weight_unit": "L",
    "ready_time": "10:20:00",
    "closing_time": "09:20:00",
    "city": "Montreal",
    "postal_code": "H8Z2Z3",
    "person_name": "Subhayu",
    "phone_number": "4801313131",
    "region_code": "QC",
    "country_code": "CA",
    "email_address": "test@mail.com",
    "instruction": "behind the front desk",
    "address_lines": ["234 rue Hubert"],
    "extra": {
        "RequestorContact": { "PersonName": "Rikhil", "Phone": "23162" }
    }
}

# create a domain pickup payload entity from the json data
# this operation will also validate the data
pickup_payload = Pickup.create(**data)

# get a carrier pickup request xml object from the pickup payload
pickup_request = proxy.mapper.create_pickup_request(pickup_payload)

# send a pickup request to the carrier servers using the proxy
response = proxy.request_pickup(pickup_request)

# extract the domain pickup entity from the carrier pickup response
pickup_response = proxy.mapper.parse_pickup_response(response)
```

```python
print(jsonify(pickup_response))
# -->
'''
[
    {
        'carrier': 'carrier_name',
        'confirmation_number': '3674',
        'pickup_charge': None,
        'pickup_date': '2013-10-09',
        'ref_times': [
            {
                'name': 'ReadyByTime', 'value': '10:30'
            },
            {
                'name': 'CallInTime', 'value': '08:30'
            }
        ]
    },
    []
]
'''
```