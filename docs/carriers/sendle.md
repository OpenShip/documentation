# Sendle

## Client Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sendle_id** | str |  |
**api_key** | str |  |
**carrier_name** | str |  | [optional][default to "Sendle"]
**server_url** | str |  | [optional][default to "https://ws.fedex.com:443/web-services"]

## Getting Started

```python
import purplship

sendle = purplship.gateway["sendle"].create(
    {
        "sendle_id": "user@id",
        "api_key": "l56berylkghekrb527l5bk7575",
    }
)
```
