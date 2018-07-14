# Welcome to OpenShip

## Mission

Most of the majors shipping carriers offer the possibility to create in-house integrated solutions using their APIs.
That is quite convenient; however, the integration task can be entirely consuming in term of resources (time and effort).

OpenShip is an open source library with the mission of making such tasks the most comfortable possible for developers.

To fulfill this mission this library focus on proposing a unified API in front of specifics carrier's API.

- Integrate multiple carriers: DHL, FedEx and more with ease
- Use an intuitive, unified API across multiple carriers
- Move fast by just reading the carrier API documentation
- Use your developer credentials with negotiated rates
- Tested

Openship prevent you from reinvinting the wheel and is easy to use:

```shell
>>> from openship.mappers.dhl import  DHLClient, DHLProxy
>>> from openship.domain.entities Tracking
>>> from gds_helpers import jsonify
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
>>> print(jsonify(trackings))
'''
[
    [
        {
            "carrier": "DHL",
            "events": [
                {
                    "code": "PU",
                    "date": "2009-08-13",
                    "description": "Shipment picked up",
                    "location": "Hong Kong - Hong Kong ",
                    "signatory": "",
                    "time": "23:58:00"
                },
                {
                    "code": "RW",
                    "date": "2009-08-14",
                    "description": "",
                    "location": "Hong Kong - Hong Kong ",
                    "signatory": "21.20",
                    "time": "02:19:50"
                }
            ],
            "shipment_date": "2009-08-13 23:58:00",
            "tracking_number": "8346088391"
        }
    ],
    []
]
'''
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

For latest dev versions

```shell
pip install --process-dependency-links -e git://github.com/OpenShip/openship.git#egg=openship
```

Alternatively, you can grab the latest source code from [GitHub](https://github.com/OpenShip/openship):

```shell
git clone https://github.com/OpenShip/openship.git
cd openship
python setup.py install
```

For released version (change '@version' at your convenience)

```shell
pip install --process-dependency-links -e git+git://github.com/OpenShip/openship.git@v1.0-beta#egg=openship
```

## License

This project is licensed under the LGPL License - see the [LICENSE.md](https://github.com/OpenShip/openship/blob/master/LICENSE) file for details

## Contributing

We happily welcome contributions, please see [CONTRIBUTING.md](https://github.com/OpenShip/openship/blob/master/CODE_OF_CONDUCT.md) for details.