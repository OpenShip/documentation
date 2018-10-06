# Roadmap

## Mappers integration

### Progress

> NOTE: PurplShip is not limited to the carriers listed here. The abstraction provided by PurplShip
> is validated by the integration of these carrier APIs.
>
> Therefore if the carrier API you did like to integrate is not listed here, the PurplShip abstraction
> can still get you quickly started.

| Carrier       | Quote          | Tracking      | Shipping       | Pickup        | Address Validation  |
| ------------- |:--------------:|:-------------:|:--------------:|:-------------:|:-------------------:|
| FedEx         | I (90%)        | I (90%)       | I (30%)        | I (30%)       | N                   |
| DHL           | I (90%)        | I (90%)       | I (90%)        | I (30%)       | N                   |
| UPS           | I (90%)        | I (90%)       | I (30%)        | I (30%)       | N                   |
| Canada Post   | I (90%)        | I (90%)       | I (30%)        | I (30%)       | N                   |
| USPS          | N              | N             | N              | N             | N                   |
| TNT           | N              | N             | N              | N             | N                   |

### Legend

- I : Implemented
- N : Not Implemented

## Tasks

- Decouple mapper interface implementation from carrier specific request

> extracting carrier entity instantiation from mapper methods will offer a clean way to integrate
> different 'sub' requests
>
> eg:
> Under DHL tracking request a KnownTrackingRequest or UnknownTrackingRequest can be instantiated
> if we know the tracking numbers or are retrieving shipment from references and shipment details

```python
from purplship.domain.entities import quote_request
from pydhl.tracking_request_known import KnownTrackingRequest
from pydhl.tracking_request_unknown import UnknownTrackingRequest

def create_quote_request(self, payload: quote_request) -> Generic[KnownTrackingRequest, UnknownTrackingRequest]:
    if is_freight_rate():
        return create_known_tracking_request(payload)
    return create_unknown_tracking_request(payload)
```

- Write quick starter for contributors
> Add dev-requirements.txt for pip install

- Publish PurplShip on pypi
> Solve the possibility to publish purplship and keep dependencies packages on GitHub so that
>
> ```shell
>    pip install --process-dependencies purplship
> ```
>
> installs purplship with dependencies like pydhl, pyups... from Github

- Set up project documentation for multi-version support
> Prepare the documentation website for the possibility of loading different released version after breaking changes

- Implement Gateway API level

```python
from purplship.domain.entities import Quote
from purplship.gateway import Gateway        # This is not implemented yet

from purplship.mappers.dhl import DHLProxy, DHLClient
from purplship.mappers.fedex import FedexProxy, FedexClient

gateway = Gateway() # This is not implemented yet

dhlProxy = DHLProxy(DHLClient(
  "server_url",
  "YOUR_DHL_SITE_ID",
  "YOUR_DHL_SITE_PASSWORD",
  "YOUR_DHL_ACCOUNT_NUMBER"
))

fedexProxy = FedexProxy(FedexClient(
  "server_url",
  "YOUR_DHL_SITE_ID",
  "YOUR_DHL_SITE_PASSWORD",
  "YOUR_DHL_ACCOUNT_NUMBER"
))

# This is not implemented yet
gateway.register_proxy(dhlProxy)
gateway.register_proxy(fedexProxy)

shipper = {"address": {"postal_code":"H3N1S4", "country_code":"CA"}}
recipient = {"address": {"city":"Lome", "country_code":"TG"}}
shipment_details = {"packages": [{"id":"1", "height":3, "lenght":10, "width":3,"weight":4.0}]}

quote_payload = Quote.create(shipper=shipper, recipient=recipient, shipment_details=shipment_details)

quotes = gateway.get_quotes(quoteR) # This is not implemented yet
```

```python
from gds_helpers import jsonify

print(jsonify(quotes))
'''
[
    [
        {
            'base_charge': 195.32,
            'carrier': 'DHL',
            'currency': 'CAD',
            'delivery_date': '2018-06-26 11:59:00',
            'discount': 0,
            'duties_and_taxes': 0,
            'extra_charges': [
                {
                    'name': 'FUEL SURCHARGE',
                    'amount': 12.7,
                    'currency': None
                }
            ],
            'pickup_date': '2018-06-21',
            'pickup_time': 'PT17H30M',
            'service_name': 'EXPRESS WORLDWIDE DOC',
            'service_type': 'TD',
            'total_charge': 208.02
        },
        {
            'base_charge': 207.47,
            'carrier': 'FedEx',
            'currency': 'USD',
            'delivery_date': None,
            'discount': 0.0,
            'duties_and_taxes': 0.0,
            'extra_charges': [
                {
                    'name': 'FUEL',
                    'amount': 8.3,
                    'currency': None
                }
            ],
            'pickup_date': None,
            'pickup_time': None,
            'service_name': 'INTERNATIONAL_ECONOMY',
            'service_type': 'PAYOR_ACCOUNT_SHIPMENT',
            'total_charge': 215.77
        }
    ],
    []
]
'''
```

- Write documentation
> - Document carrier clients properties
> - Getting started with a single carrier
> - Getting started with multiple carriers

- Examples: Use case
> - Tracking notification Slack app
> - Lightweight shipping REST API