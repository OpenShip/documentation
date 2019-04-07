# UPS

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | str |  |
**password** | str |  |
**access_license_number** | str |  |
**carrier_name** | str |  | [optional][default to "UPS"]
**server_url** | str |  | [optional][default to "https://onlinetools.ups.com/webservices"]

## Getting Started

```python
import purplship
from purplship.mappers.ups import UPSClient

ups = purplship.gateway["ups"].create(
    UPSClient(
        sendle_id="username",
        api_key="password",
    )
)
```
