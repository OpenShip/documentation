# Shipping

Use a proxy and, it's mapper to create a shipment.

```python
from purplship.domain.entities import Shipment

# JSON data
shipper = {
    "company_name": "shipper company privated limited 12",
    "address_lines": ["238 850925434 Drive"],
    "city": "Scottsdale",
    "postal_code": "85260",
    "country_code": "US",
    "country_name": "United States of America",
    "person_name": "Ms Lucian",
    "phone_number": "1 23 8613402",
    "email_address": "test@email.com",
    "region": "Arizona",
    "region_code": "AZ",
    "extra": {
        "ShipperID": "123456789",
        "RegisteredAccount": "123456789",
        "PhoneExtension": "3403",
        "FaxNumber": "1 905 8613411",
        "Telex": "1245"
    }
}
recipient = {
    "company_name": "IBM Bruse Pte Ltd",
    "address_lines": ["9 Business Park Central 1", "3th Floor", "The IBM Place"],
    "city": "Brussels",
    "postal_code": "1060",
    "country_code": "BE",
    "country_name": "Belgium",
    "person_name": "Mrs Orlander",
    "phone_number": "506-851-2271",
    "email_address": "c_orlander@gc.ca",
    "extra": {
        "PhoneExtension": "7862",
        "FaxNumber": "506-851-7403",
        "Telex": "506-851-7121"
    }
}
shipment = {
    "packages": [{"id": "1", "height": 3, "length": 10, "width": 3, "weight": 4.0, "packaging_type": "EE"}],
    "is_document": False,
    "shipper_account_number": "123456789",
    "paid_by": "S",
    "payment_account_number": "123456789",
    "duty_paid_by": "S",
    "duty_payment_account": "123456789",
    "declared_value": 200.00,
    "label": {"type": "CIN", "format": "PDF", "extra": {"Image": b"SUkqAAgA"}},
    "services": ["WY"],
    "commodities": [{"code": "cc", "description": "cn"}],
    "extra": {"EProcShip": "N", "GlobalProductCode": "P", "LocalProductCode": "P"},
    "customs": {
        "terms_of_trade": "DAP",
        "extra": {
            "ScheduleB": "3002905110",
            "ExportLicense": "D123456",
            "ShipperEIN": "112233445566",
            "ShipperIDType": "S",
            "ImportLicense": "ImportLic",
            "ConsigneeEIN": "ConEIN2123"
        }
    }
}

# create a domain shipping payload entity from the json data
# this operation will also validate the data
shipping_payload = Shipment.create(shipper=shipper, recipient=recipient, shipment=shipment)

# get a carrier shipping request xml object from the quote payload
shipping_request = proxy.mapper.create_shipment_request(shipping_payload)

# send a shipping request to the carrier servers using the proxy
response = proxy.create_shipping(shipping_request)

# extract the domain shipping entity from the carrier shipping response
shipping = proxy.mapper.parse_shipping_response(response)
```

```python
print(jsonify(shipping))
# -->
'''
[
    {
        'carrier': 'carrier_name',
        'documents': [
            'iVBORw0KGgoAAAANSUhEUgAAAYwAAABeAQMAAAAKdrGZAAAABlBMVEX///8AAABVwtN+AAAAaklEQVR42mNkYGBIyL8w5a9P7YJXKU8ZgkU2V81cNmWt5IIokaMMX40+N6zsivI+93bZRDMx13vzlRYwMDAxkAxGtYxqGdUyqmVUy6iWUS2jWka1jGoZ1TKqZVTLqJZRLaNaRrWMaiEVAAB3uBe8nSip8QAAAABJRU5ErkJggg==',
            'iVBORw0KGgoAAAANSUhEUgAAAZYAAABeAQMAAAA6+qC4AAAABlBMVEX///8AAABVwtN+AAAAZ0lEQVR42u3LIRJAUBRA0Ufwk6IY0eqMLBnBS/yi6Gb8XdiBPRBoZE1iDZpwTz+eiJRhNey2qNNZjUZnMMaLmzVR6W5TNfGaNe46Wp3kybfeivjyHYfD4XA4HA6Hw+FwOBwOh/On8wLTGBe8mbtkhgAAAABJRU5ErkJggg==',
            'iVBORw0KGgoAAAANSUhEUgAAAYwAAABeAQMAAAAKdrGZAAAABlBMVEX///8AAABVwtN+AAAAaklEQVR42mNkYGBIyL8w5a9P7YJXKU8ZgkU2V81cNmWt5IIokaMMX40+N6zsivI+93bZRDMx13vzlRYwMDAxkAxGtYxqGdUyqmVUy6iWUS2jWka1jGoZ1TKqZVTLqJZRLaNaRrWMaiEVAAB3uBe8nSip8QAAAABJRU5ErkJggg==',
            'iVBORw0KGgoAAAANSUhEUgAAATUAAABeAQMAAAB4lRFqAAAABlBMVEX///8AAABVwtN+AAAAVklEQVR42mNkYGBIyL8whdvO9d6UK0e/3puyeZrrvfkaYnOvlzGm6v4Sjsq/MPECAwMTA3FgVN2oulF1o+pG1Y2qG1U3qm5U3ai6UXWj6kbVjaqjhjoAdiwSvEkaxBcAAAAASUVORK5CYII=',
            'iVBORw0KGgoAAAANSUhEUgAAARgAAAAkAQMAAABoj7etAAAABlBMVEX///8AAABVwtN+AAAAPElEQVR42mNkYGBIyL8wZcutGwyvUp4yBMtriM295XDlxCm29MRU31ufpRgYmBgIg1E1o2pG1YyqGepqAKFJD0hDGoJfAAAAAElFTkSuQmCC',
            'iVBORw0KGgoAAAANSUhEUgAAAawAAABeAQMAAABFK7JJAAAABlBMVEX///8AAABVwtN+AAAAaUlEQVR42u3LoRVAUACG0Z/gKLKjOK+YhRlMIOko7xUDSBqSUQyhaFYgsYMkfLdfT1ITdUdcL+PtNpuEqYrJJjZ3g06XXZ7Rs1cKZil2TV+ubW4kX5/QaDQajUaj0Wg0Go1Go9FotH+3F1GxE7xDV+SvAAAAAElFTkSuQmCC'
        ],
        'reference': {
            'type': 'St',
            'value': 'reference'
        },
        'service': 'EXPRESS WORLDWIDE',
        'shipment_date': '2017-11-10',
        'total_charge': {
            'amount': '155.160',
            'currency': 'USD',
            'name': 'Shipment charge'
        },
        'tracking_number': '0044650491'
    },
    []
]
'''
```