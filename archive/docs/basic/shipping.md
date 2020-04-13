# Shipping

Use a proxy and, it's mapper to create a shipment.

```python
from purplship.domain.Types import (
    ShipmentRequest,
    Shipment,
    Party,
    Customs,
    Item
)

# JSON data
shipper = Party(
    company_name="shipper company privated limited 12",
    address_lines=["238 850925434 Drive"],
    city="Scottsdale",
    postal_code="85260",
    country_code="US",
    person_name="Ms Lucian",
    phone_number="1 23 8613402",
    email_address="test@email.com",
    region="Arizona",
    region_code="AZ",
    extra= {
        "ShipperID": "123456789",
        "RegisteredAccount": "123456789",
        "PhoneExtension": "3403",
        "FaxNumber": "1 905 8613411",
        "Telex": "1245"
    }
)
recipient = Party(
    company_name="IBM Bruse Pte Ltd",
    address_lines=["9 Business Park Central 1", "3th Floor", "The IBM Place"],
    city="Brussels",
    postal_code="1060",
    country_code="BE",
    person_name="Mrs Orlander",
    phone_number="506-851-2271",
    email_address="c_orlander@gc.ca",
    extra= {
        "PhoneExtension": "7862",
        "FaxNumber": "506-851-7403",
        "Telex": "506-851-7121"
    }
)
shipment = Shipment(
    packages=[
        Item(height=3, length=10, width=3, weight=4.0, packaging_type="EE")
    ],
    is_document=False,
    shipper_account_number="123456789",
    paid_by="S",
    payment_account_number="123456789",
    duty_paid_by="S",
    duty_payment_account="123456789",
    declared_value=200.00,
    services=["WY"],
    extra= {"EProcShip": "N", "GlobalProductCode": "P", "LocalProductCode": "P"},
    customs= Customs(
        terms_of_trade="DAP",
        extra={
            "ScheduleB": "3002905110",
            "ExportLicense": "D123456",
            "ShipperEIN": "112233445566",
            "ShipperIDType": "S",
            "ImportLicense": "ImportLic",
            "ConsigneeEIN": "ConEIN2123"
        }
    )
)

# create a domain shipping payload entity from the json data
# this operation will also validate the data
shipping_payload = ShipmentRequest(
    shipper=shipper,
    recipient=recipient,
    shipment=shipment
)

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

## Datatypes

### ShipmentRequest

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**shipper** | [**Party**](#party) |  | 
**recipient** | [**Party**](#party) |  | 
**shipment** | [**Shipment**](#shipment) |  | 

### Party

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**postal_code** | **str** | postal code | [optional] 
**city** | **str** | city | [optional] 
**type** | **str** | type (supported by certain carriers) | [optional] 
**tax_id** | **str** | Tax Identification Number | [optional] 
**person_name** | **str** | Attention Name | [optional] 
**company_name** | **str** | Company Name | [optional] 
**country_name** | **str** | Country Name | [optional] 
**country_code** | **str** | Country Code | [optional] 
**phone_number** | **str** | Phone Number | [optional] 
**email_address** | **str** | Email Address | [optional] 
**state** | **str** | Province or State name | [optional] 
**state_code** | **str** | Province or State code | [optional] 
**address_lines** | **list[str]** | Address lines | [optional] 
**account_number** | **str** | Account Number | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]

### Shipment

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [**list[Item]**](#item) | list of shipment items | 
**insured_amount** | **float** | Insured amount | [optional] 
**total_items** | **int** | Number of items | [optional] 
**packaging_type** | **str** |           shipment packaging type         default: &#39;BOX&#39;          | [optional] [default to 'BOX']
**is_document** | **bool** | Document only shipment flag. (Non dutiable for international shipping) | [optional] 
**currency** | **str** | General shipment values currency | [optional] 
**total_weight** | **float** | Total shipment weight | [optional] 
**weight_unit** | **str** |          General package weight unit.         Supported Units: \&quot;LB\&quot; (Pound), \&quot;KG\&quot; (Kilogram)         default: &#39;KG&#39;          | [optional] [default to 'KG']
**dimension_unit** | **str** |          General package dimensions unit.         Supported Units: \&quot;IN\&quot; (Inch), \&quot;CM\&quot; (Centimeter)         default: &#39;CM&#39;          | [optional] [default to 'CM']
**paid_by** | **str** |          Shipment paid by.         Values: \&quot;SENDER\&quot;, \&quot;THIRD_PARTY\&quot;, \&quot;RECIPIENT\&quot;          | [optional] 
**payment_country_code** | **str** | Payment country code | [optional] 
**payment_account_number** | **str** | Shipment payment account number | [optional] 
**services** | **list[str]** | Shipment services (check carriers services docs) | [optional] 
**options** | **list[str]** | Additional shipment options (check docs) | [optional] 
**date** | **str** | Shipment date | [optional] 
**payment_type** | **str** |      Payment type: account_number, credit_card      | [optional] 
**duty_paid_by** | **str** |          Shipment paid by.         Values: \&quot;SENDER\&quot;, \&quot;THIRD_PARTY\&quot;, \&quot;RECIPIENT\&quot;         default: &#39;SENDER&#39;          | [optional] [default to 'SENDER']
**duty_payment_account** | **str** | Duty payer account number | [optional] 
**declared_value** | **float** | Shipment total value | [optional] 
**customs** | [**Customs**](#customs) |  | [optional] 
**references** | **list[str]** |      Shipment references.     Ex: order number, platform reference...       | [optional] 
**label** | [**Label**](#label) |  | [optional] 
**invoice** | [**Invoice**](#invoice) |  | [optional] 
**ship_date** | **str** | Expected shipment date (supported by certain carriers) | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]

### Item

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | item id | [optional] 
**weight** | **float** | item weight | 
**width** | **float** | item width | [optional] 
**height** | **float** | item height | [optional] 
**length** | **float** | item lenght | [optional] 
**packaging_type** | **str** |           item packaging type         default: &#39;BOX&#39;          | [optional] [default to 'BOX']
**description** | **str** | item description | [optional] 
**content** | **str** | item content details | [optional] 
**quantity** | **int** | item quantity | [optional] 
**sku** | **str** | item SKU | [optional] 
**code** | **str** | item code (supported by few carriers) | [optional] 
**value_amount** | **float** | item value | [optional] 
**value_currency** | **str** | item value currency | [optional] 
**origin_country** | **str** | item origin country (check the docs) | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]

### Customs

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **str** | shipment description | [optional] 
**terms_of_trade** | **str** | Terms of trades (check the docs) | [optional] 
**no_eei** | **str** | NOEEI type of the shipment. | [optional] 
**aes** | **str** | AES / ITN reference of the shipment. | [optional] 
**items** | [**list[Item]**](#item) | list of items for customs | 
**commercial_invoice** | **bool** | Specify if shipment is commercial | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional] 

### Label

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**format** | **str** | label format | [optional] 
**type** | **str** | label type | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional]

### Invoice

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **str** | invoice date | [optional] 
**identifier** | **str** | invoice identifier | [optional] 
**type** | **str** | invoice type | [optional] 
**copies** | **int** | Number of copies | [optional] 
**extra** | **dict(str, str)** | extra field for special details supported by a specific carriers | [optional] 