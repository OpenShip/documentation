# Pickup

## Pickup booking

```python
from purplship.domain.Types import PickupRequest

pickup_booking = PickupRequest(
    date="2013-10-19",
    account_number="123456789",
    pieces=2,
    weight=2.0,
    weight_unit="LB",
    ready_time="10:20:00",
    closing_time="09:20:00",
    city="Montreal",
    postal_code="H8Z2Z3",
    person_name="Subhayu",
    phone_number="4801313131",
    region_code="QC",
    country_code="CA",
    email_address="test@mail.com",
    instruction="behind the front desk",
    address_lines=["234 rue Hubert"],
    extra={
        "RequestorContact": { "PersonName": "Rikhil", "Phone": "23162" }
    }
)

# create a carrier specific pickup request object from the rate payload
carrier_pickup_booking = proxy.mapper.create_pickup_request(pickup_booking)

# send a pickup booking request to the carrier servers using the proxy
response = proxy.create_pickup_request(carrier_pickup_booking)

# extract the domain pickup details from the carrier pickup response
pickup_details = proxy.mapper.parse_quote_response(response)

from gds_helpers import to_dict
print(to_dict(pickup_details))
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

## Pickup update

```python

response = proxy.modify_pickup_request(...)
```

## Pickup cancellation

```python

response = proxy.create_pickup_cancellation_request(...)
```

## Datatypes

### PickupRequest (For Booking and Updte)

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **str** | Pickup date | [optional]
**account_number** | **str** | Shipper account number | [optional]
**weight** | **float** | Shipment total weight | [optional]
**weight_unit** | **str** |          General package weight unit.         Supported Units: "LB" (Pound), "KG" (Kilogram)  default: "KG"  | [optional] [default to 'KG']
**pieces** | **float** | Number of shipment pieces | [optional]
**ready_time** | **str** |      Shipment ready time for pickup.     Format: '00:00', 'TT:MM'      | [optional
**closing_time** | **str** |      Pickup location closing time.     Format: '00:00', 'TT:MM'      | [optional]
**instruction** | **str** | Pickup instruction | [optional]
**package_location** | **str** |      Shipment items location.     Ex: Back of the entrance door      | [optional
**city** | **str** | Pickup address city | [optional]
**postal_code** | **str** | Pickup address postal code | [optional]
**state** | **str** | Pickup address state or province name | [optional]
**state_code** | **str** | Pickup address state or province code | [optional]
**country_name** | **str** | Pickup address country name | [optional]
**country_code** | **str** | Pickup address country code | [optional]
**person_name** | **str** | Pickup attention name | [optional]
**company_name** | **str** | Pickup company name (if company) | [optional]
**phone_number** | **str** | Phone number | [optional]
**email_address** | **str** | Email address | [optional]
**is_business** | **bool** | Flag to specify if pickup address is a business | [optional]
**confirmation_number** | **str** | Pickup confirmation number (only required for a pickup update) | [optional]
**address_lines** | **list[str]** | Address lines | [optional]
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]

### Pickup cancellation request

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**pickup_date** | **str** | Pickup date |
**confirmation_number** | **str** | Pickup date |
**person_name** | **str** | Pickup date | [optional]
**country_code** | **str** | Pickup date | [optional]
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]
