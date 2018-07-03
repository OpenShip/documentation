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
            "carrier": "carrier_name",
            "events": [
                {
                    "code": "PU",
                    "date": "2009-08-28",
                    "description": "Shipment picked up",
                    "location": "Barcelona - Spain ",
                    "signatory": "960528602",
                    "time": "13:26:00"
                },
                {
                    "code": "PO",
                    "date": "2009-08-28",
                    "description": "Departing origin",
                    "location": "Barcelona - Spain ",
                    "signatory": " 00:00:00",
                    "time": "19:27:00"
                },
                {
                    "code": "RW",
                    "date": "2009-08-28",
                    "description": "",
                    "location": "Barcelona - Spain ",
                    "signatory": "",
                    "time": "19:27:00"
                },
                {
                    "code": "PL",
                    "date": "2009-08-28",
                    "description": "Processed at Location Barcelona - Spain ",
                    "location": "Barcelona - Spain ",
                    "signatory": "",
                    "time": "20:39:01"
                },
                {
                    "code": "AF",
                    "date": "2009-08-28",
                    "description": "Arrived at DHL facility in Barcelona -\n                        Spain ",
                    "location": "Barcelona - Spain ",
                    "signatory": "",
                    "time": "21:17:57"
                },
                {
                    "code": "DF",
                    "date": "2009-08-28",
                    "description": "Departed from DHL facility in Barcelona\n                        - Spain ",
                    "location": "Barcelona - Spain ",
                    "signatory": "",
                    "time": "22:01:00"
                },
                {
                    "code": "AF",
                    "date": "2009-08-29",
                    "description": "Arrived at DHL facility in Leipzig -\n                        Germany ",
                    "location": "Leipzig - Germany ",
                    "signatory": "",
                    "time": "00:32:16"
                },
                {
                    "code": "PL",
                    "date": "2009-08-29",
                    "description": "Processed at Location Leipzig - Germany ",
                    "location": "Leipzig - Germany ",
                    "signatory": "",
                    "time": "01:05:03"
                },
                {
                    "code": "DF",
                    "date": "2009-08-29",
                    "description": "Departed from DHL facility in Leipzig -\n                        Germany ",
                    "location": "Leipzig - Germany ",
                    "signatory": "",
                    "time": "05:52:19"
                },
                {
                    "code": "AF",
                    "date": "2009-08-30",
                    "description": "Arrived at DHL facility in Bergamo -\n                        Italy ",
                    "location": "Bergamo - Italy ",
                    "signatory": "",
                    "time": "19:43:22"
                },
                {
                    "code": "PL",
                    "date": "2009-08-30",
                    "description": "Processed at Location Bergamo - Italy ",
                    "location": "Bergamo - Italy ",
                    "signatory": "",
                    "time": "23:30:00"
                },
                {
                    "code": "DF",
                    "date": "2009-08-31",
                    "description": "Departed from DHL facility in Bergamo -\n                        Italy ",
                    "location": "Bergamo - Italy ",
                    "signatory": "",
                    "time": "02:06:00"
                },
                {
                    "code": "DF",
                    "date": "2009-08-31",
                    "description": "Departed from DHL facility in Milan -\n                        Italy ",
                    "location": "Milan - Italy ",
                    "signatory": "",
                    "time": "06:23:00"
                },
                {
                    "code": "AR",
                    "date": "2009-08-31",
                    "description": "Arrived at DHL facility in Milan -\n                        Italy ",
                    "location": "Milan - Italy ",
                    "signatory": "",
                    "time": "08:59:00"
                },
                {
                    "code": "WC",
                    "date": "2009-08-31",
                    "description": "With delivery courier",
                    "location": "Milan - Italy ",
                    "signatory": "",
                    "time": "09:19:00"
                },
                {
                    "code": "OK",
                    "date": "2009-08-31",
                    "description": "Shipment delivered",
                    "location": "Milan - Italy ",
                    "signatory": "CAMPAGNA",
                    "time": "10:09:00"
                }
            ],
            "shipment_date": "2009-08-28 13:26:00",
            "tracking_number": "3180831640"
        },
        {
            "carrier": "carrier_name",
            "events": [
                {
                    "code": "PU",
                    "date": "2009-08-26",
                    "description": "Shipment picked up",
                    "location": "Singapore - Singapore ",
                    "signatory": "",
                    "time": "10:00:00"
                }
            ],
            "shipment_date": "2009-08-26 10:00:00",
            "tracking_number": "7740842550"
        },
        {
            "carrier": "carrier_name",
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
            "tracking_number": "1815115363"
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