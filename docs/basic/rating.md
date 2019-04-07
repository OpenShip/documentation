# Rating (Quotes)

Use a proxy, and it's mapper to get a carrier quote.

```python
from purplship.domain.Types import (
    Party,
    Item,
    Shipment,
    RateRequest
)

# Request data

shipper = Party(
    postal_code="H3N1S4",
    country_code="CA"
)
recipient = Party(
    city="Lome",
    country_code="TG"
)
shipment_details = Shipment(
    items=[
        Item(id="1", height=3, lenght=10, width=3, weight=4.0)
    ]
)

# create a domain quote payload entity from the json data
# this operation will also validate the data
rate_request = RateRequest(
    shipper=shipper,
    recipient=recipient,
    shipment_details=shipment_details
)

# create a carrier specific quote request object from the rate payload
dhl_rate_request = proxy.mapper.create_quote_request(rate_request)

# send a quote request to the carrier servers using the proxy
response = proxy.get_quotes(dhl_rate_request)

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
            "discount": 0.0,
            "duties_and_taxes": 0.0,
            "extra_charges": [
                {
                    "name": "FUEL",
                    "value": 9.22
                }
            ],
            "service_name": "INTERNATIONAL_PRIORITY",
            "service_type": "PAYOR_ACCOUNT_SHIPMENT",
            "total_charge": 239.71
        },
        {
            "base_charge": 207.47,
            "carrier": "carrier",
            "discount": 0.0,
            "duties_and_taxes": 0.0,
            "extra_charges": [
                {
                    "name": "FUEL",
                    "value": 8.3
                }
            ],
            "service_name": "INTERNATIONAL_ECONOMY",
            "service_type": "PAYOR_ACCOUNT_SHIPMENT",
            "total_charge": 215.77
        }
    ],
    []
]
'''
```

## Datatypes

### RateRequest

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
