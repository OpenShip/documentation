# PurplShip 'Proxy'

The proxy serve as the gateway responsible for forwarding requests to the right logistic providers service endpoint.
A proxy is therefore specific to a provider

## Instantiating a proxy

``` python tab="Proxy"
from purplship.mappers.fedex import FedexProxy, FedexClient

fedex_proxy = FedexProxy(
    FedexClient(
        user_key="username",
        password="password",
        meter_number="1324913439840",
        account_number="103948734",
    )
)
```

```python tab="Gateway"
import purplship

fedex_gateway = purplship.gateway["fedex"].create(
    {
        "user_key": "username",
        "password": "password",
        "meter_number": "1324913439840",
        "account_number": "103948734",
    }
)
```

!!! note "Proxy vs Gateway"
    the `carrier_gateway` is exactly the same as a `carrier_gateway` they are interchangeable. the gateway is used in the context of the [fluent API](/basic/fluent-api) whereas the proxy is used in the context of a native purplship implementation.

Find more about the <a href="https://doc.purplship.com/api/purplship.domain.html?highlight=prox#module-purplship.domain.proxy" target="_blank">Proxy interface API</a>
