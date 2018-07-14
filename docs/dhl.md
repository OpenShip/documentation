# DHL

## Client

Configure your client

```python
from openship.mappers.dhl import  DHLClient

dhlClient = DHLClient(
  "https://xmlpi-ea.dhl.com/XMLShippingServlet",
  "YOUR_DHL_SITE_ID",
  "YOUR_DHL_SITE_PASSWORD",
  "YOUR_DHL_ACCOUNT_NUMBER",
  "CARRIER_NAME"              # optional will be DHL by default
)
```

## Proxy

Use the default proxy.

```python
from openship.mappers.dhl import DHLProxy

dhlProxy = DHLProxy(dhlClient)
```

Or create a proxy with a custom mapper.

```python
from openship.mappers.dhl.dhl_mapper import DHLMapper

dhlMapper = DHLMapper(dhlClient)
customProxy = DHLProxy(dhlClient, dhlMapper)
```

## Quotes

Use DHL mapper and proxy to get quotes.

```python
from openship.domain.entities import Quote
from gds_helpers import jsonify

# JSON data

shipper = {"address": {"postal_code":"H3N1S4", "country_code":"CA"}}
recipient = {"address": {"city":"Lome", "country_code":"TG"}}
shipment_details = {"packages": [{"id":"1", "height":3, "lenght":10, "width":3,"weight":4.0}]}

# create domain quote request payload from json
payload = Quote.create(shipper=shipper, recipient=recipient, shipment_details=shipment_details)

# get DHL quote request xml object from payload 
request = dhlProxy.mapper.create_quote_request(payload)

#request quotes from DHL servers using the provider
response = dhlProxy.get_quotes(request)

#extract domain response from DHL quote response
quotes = dhlProxy.mapper.parse_quote_response(response)

print(jsonify(quotes))
# -->
#[
#    [
#        {
#            "base_charge": 195.32,
#            "carrier": "DHL",
#            "discount": 0,
#            "duties_and_taxes": 0,
#            "extra_charges": [
#                {
#                    "name": "FUEL SURCHARGE",
#                    "value": 12.7
#                }
#            ],
#            "service_name": "EXPRESS WORLDWIDE DOC",
#            "service_type": "TD",
#            "total_charge": 208.02
#        }
#    ],
#    []--> Error list
#]
```
