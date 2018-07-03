# Welcome to OpenShip

## Mission

Most of the majors shipping carriers offer the possibility to create in-house integrated solutions
using their API. That is quite convenient, however, the integration task can be quite consuming in term of resources (time and effort).

OpenShip is an open source library with the mission of making such tasks the easiest possible for developers.

To fulfill this mission this library focus on proposing a united API in front of specifics carrier's API.

- Integrate multiple cariers: DHL, FedEx and more with ease
- Use an intuitive unified API accross multiple cariers
- Move fast by just reading the carier API documentation
- Use your own developer credentials with negociated rates
- Tested

Openship prevent you from reinvinting the wheel and is easy to use:

```shell
>>> from openship.mappers.dhl import  DHLClient, DHLProxy
>>> from openship.domain.entities Tracking
>>> client = DHLClient(
    "https://xmlpi-ea.dhl.com/XMLShippingServlet",
    "YOUR_DHL_SITE_ID",
    "YOUR_DHL_SITE_PASSWORD",
    "YOUR_DHL_ACCOUNT_NUMBER",
    "CARRIER_NAME"
  )
>>> proxy = DHLProxy(client)
>>> payload = Tracking.create(tracking_numbers=["8346088391"])
>>> tracking_req_xml_obj = proxy.mapper.create_tracking_request(payload)
>>> response = proxy.get_trackings(tracking_req_xml_obj)
>>> trackings = proxy.mapper.parse_tracking_response(response)
```

## Navigation

- [Architecture](/architecture)
- **Mappers**
    - [DHL](/dhl)
    - [FeDex](/fedex)

### Prerequisites

OpenShip is compatible with Python 3 +

### Installing

OpenShip can be installed with [pip](https://pip.pypa.io/):

```shell
pip install --process-dependency-links -e git://github.com/OpenShip/openship.git#egg=openship
```

Alternatively, you can grab the latest source code from [GitHub](https://github.com/OpenShip/openship):

```shell
git clone https://github.com/OpenShip/openship.git
cd openship
python setup.py install
```

## License

This project is licensed under the LGPL License - see the [LICENSE.md](https://github.com/OpenShip/openship/blob/master/LICENSE) file for details

## Contributing

We happily welcome contributions, please see [CONTRIBUTING.md](https://github.com/OpenShip/openship/blob/master/CODE_OF_CONDUCT.md) for details.