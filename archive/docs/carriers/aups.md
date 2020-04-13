# Australia Post

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**api_key** | str |  |
**password** | str |  | [optional]
**account_number** | str |  | [optional]
**carrier_name** | str |  | [optional][default to "AustraliaPost"]
**api** | str |  | [optional][default to "Logistic"]

## Getting Started

### Shipping and Tracking (Logistic)

```python
import purplship

aups = purplship.gateway["aups"].create(
    {
        "api_key": "username",
        "password": "password",
        "account_number": "1324913439840"
    }
)
```

### Postage Assessment Calculator - PAC (Postage)

```python
aups = purplship.gateway["aups"].create(
    {
        "api_key": "username",
        "api": "Postage"
    }
)
```
