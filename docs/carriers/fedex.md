# FedEx

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**site_id** | str |  |
**password** | str |  |
**meter_number** | str |  |
**account_number** | str |  |
**carrier_name** | str |  | [optional][default to "FedEx"]
**server_url** | str |  | [optional][default to "https://ws.fedex.com:443/web-services"]

## Getting Started

```python
import purplship

fedex = purplship.gateway["fedex"].create(
    {
        "user_key": "username",
        "password": "password",
        "meter_number": "1324913439840",
        "account_number": "103948734",
    }
)
```
