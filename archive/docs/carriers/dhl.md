# DHL

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**site_id** | str |  |
**password** | str |  |
**carrier_name** | str |  | [optional][default to "DHL"]
**server_url** | str |  | [optional][default to "https://xmlpi-ea.dhl.com/XMLShippingServlet"]

## Getting Started

```python
import purplship

dhl = purplship.gateway["dhl"].create(
    {
        "site_id": "site_id",
        "password": "password",
    }
)
```
