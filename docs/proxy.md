# DHL

## Client

Configure your carrier client using your credential

```python
from purplship.mappers.dhl import  DHLClient

dhlClient = DHLClient(
  "https://xmlpi-ea.dhl.com/XMLShippingServlet",
  "YOUR_DHL_SITE_ID",
  "YOUR_DHL_SITE_PASSWORD",
  "YOUR_DHL_ACCOUNT_NUMBER",
  "CARRIER_NAME"              # optional, will be DHL by default
)
```

## Proxy

Use the default proxy by providing your client

```python
from purplship.mappers.dhl import DHLProxy

dhlProxy = DHLProxy(dhlClient)
```

Or create a proxy with a custom mapper (If you extend or implement your own compatible Mapper).

```python
from purplship.mappers.dhl.dhl_mapper import DHLMapper

dhlMapper = DHLMapper(dhlClient)
customProxy = DHLProxy(dhlClient, dhlMapper)
```