# Canada Post

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | str |  |
**password** | str |  |
**custumer_number** | str |  |
**carrier_name** | str |  | [optional][default to "CanadaPost"]
**server_url** | str |  | [optional][default to "https://soagw.canadapost.ca"]

## Getting Started

```python
import purplship

caps = purplship.gateway["caps"].create(
    {
        "username": "username",
        "password": "password",
        "customer_number": "1324913439840",
    }
)
```
