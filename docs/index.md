# Welcome to PurplShip

[![Build Status](https://travis-ci.org/PurplShip/purplship.svg?branch=master)](https://travis-ci.org/PurplShip/purplship) [![codecov](https://codecov.io/gh/PurplShip/purplship/branch/master/graph/badge.svg)](https://codecov.io/gh/PurplShip/purplship)

## Mission

Most of the major shipping carriers offer the possibility to create in-house integrated solutions using their APIs.
That is quite convenient; however, the integration can be very costly regarding time and effort.

PurplShip is an open source library with the mission of making such tasks as comfortable as possible for developers.

This library focuses on proposing a unified API, to fulfill the mission.

- Integrate multiple carriers: DHL, FedEx, UPS, Canada Post and more with ease
- Use an intuitive, unified API across multiple carriers
- Use your developer credentials with negotiated rates

PurplSHip prevents you from reinvinting the wheel and is easy to use:

```shell
>>> from purplship.mappers.dhl import  DHLClient, DHLProxy
>>> from purplship.domain.entities import Tracking
>>> from gds_helpers import jsonify
>>> client = DHLClient(
    "https://xmlpi-ea.dhl.com/XMLShippingServlet",
    "YOUR_DHL_SITE_ID",
    "YOUR_DHL_SITE_PASSWORD",
    "YOUR_DHL_ACCOUNT_NUMBER",
    "CARRIER_NAME"
  )
>>> proxy = DHLProxy(client)
>>> tracking_payload = Tracking.create(tracking_numbers=["8346088391"])
>>> tracking_request = proxy.mapper.create_tracking_request(tracking_payload)
>>> response = proxy.get_trackings(tracking_request)
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
- [Roadmap](/roadmap)
- **Features**
    - [Quote](/quote)
    - [Tracking](/tracking)
    - [Shipping](/shipping)
    - [Pickup](/pickup)

### Prerequisites

PurplShip is compatible with Python 3 +

### Installing

PurplShip can be installed with [pip](https://pip.pypa.io/):

For latest dev versions

```shell
pip install --process-dependency-links -e git://github.com/PurplShip/purplship.git#egg=purplship    
```

Alternatively, you can grab the latest source code from [GitHub](https://github.com/PurplShip/purplship):

```shell
git clone https://github.com/PurplShip/purplship.git
pip install --process-dependency-links -e purplship   
```

For released version (specify a purplship==version if needed)

```shell
pip install -f https://git.io/fxTZ6 purplship   
```

## License

This project is licensed under the LGPL License - see the [LICENSE.md](https://github.com/PurplShip/purplship/blob/master/LICENSE) file for details

## Contributing

We happily welcome contributions, please see [CONTRIBUTING.md](https://github.com/PurplShip/purplship/blob/master/CODE_OF_CONDUCT.md) for details.