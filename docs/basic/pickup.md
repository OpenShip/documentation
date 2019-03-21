# Pickup

## Pickup booking

```python
import purplship

dhl = purplship.gateway['dhl'].create({...})

pickup_booking = purplship.pickup.book(**{
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
}).with_(dhl)

response = pickup_booking.parse()

from gds_helpers import to_dict
print(to_dict(response))
```

```json
[
    {
        "carrier": "carrier_name",
        "confirmation_number": "3674",
        "pickup_date": "2013-10-09",
        "ref_times": [
            {
                "name": "ReadyByTime", "value": "10:30"
            },
            {
                "name": "CallInTime", "value": "08:30"
            }
        ]
    },
    []
]
```

### Pickup request and update request payload

```json
{
    "date": "string",
    "account_number": "string",
    "weight": 0,
    "weight_unit": "KG",
    "pieces": 0,
    "ready_time": "string",
    "closing_time": "string",
    "instruction": "string",
    "package_location": "string",
    "city": "string",
    "postal_code": "string",
    "state": "string",
    "state_code": "string",
    "country_name": "string",
    "country_code": "string",
    "person_name": "string",
    "company_name": "string",
    "phone_number": "string",
    "email_address": "string",
    "is_business": true,
    "confirmation_number": "string",
    "address_lines": [
        "address 1"
        "address 2"
    ],
    "extra": {
        "extra_field": ""
    }
}
```

## Pickup update

```python

pickup_update = purplship.pickup.update(
    ...
    ).from_(dhl).parse()
```

## Pickup cancellation

```python

pickup_update = purplship.pickup.cancel(
    ...
    ).from_(dhl).parse()
```
