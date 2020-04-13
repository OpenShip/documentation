# USPS

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | str |  |
**password** | str |  |
**carrier_name** | str |  | [optional][default to "USPS"]
**server_url** | str |  | [optional][default to "https://secure.shippingapis.com/ShippingAPI.dll"]

## Getting Started

```python
import purplship
from purplship.mappers.usps import USPSClient

usps = purplship.gateway["usps"].create(
    USPSClient(
        sendle_id="username",
        api_key="password",
    )
)
```