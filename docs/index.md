# Welcome to PurplShip

[![Build Status](https://travis-ci.org/PurplShip/purplship.svg?branch=master)](https://travis-ci.org/PurplShip/purplship) [![codecov](https://codecov.io/gh/PurplShip/purplship/branch/master/graph/badge.svg)](https://codecov.io/gh/PurplShip/purplship)

## Overview

PurplShip is an open source library which makes shipping carrier API integration
easy.
PurplShip proposes an intuitive unified API, to make multi-carrier integration seamless.

- Integrate multiple carriers: DHL, FedEx, UPS, Canada Post and more with ease
- Use an intuitive, unified API across multiple carriers
- Use your developer credentials with negotiated rates

PurplShip helps not having to reinvent the wheel and is easy to use:

```python
import purplship

proxy = purplship.gateway['dhl'].create({
    "server_url": "https://xmlpi-ea.dhl.com/XMLShippingServlet",
    "site_id": "YOUR_DHL_SITE_ID",
    "password": "YOUR_DHL_SITE_PASSWORD",
    "account_number": "YOUR_DHL_ACCOUNT_NUMBER"
})

tracking_response = purplship.rating.fetch(
        tracking_numbers=["8346088391"]
    ).from_(proxy)

tracking = tracking_response.parse()

from gds_helpers import to_dict

print(to_dict(tracking))

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

### Prerequisites

PurplShip is compatible with Python 3 +

### Installing

PurplShip can be installed with [pip](https://pip.pypa.io/):

Released version (specify a purplship==version if needed)

```bash
pip install -f https://git.io/purplship purplship
```

From [Source](https://github.com/PurplShip/purplship):

```shell
git clone https://github.com/PurplShip/purplship.git
pip install --process-dependency-links -e purplship
```

## License

This project is licensed under the LGPL v3 License - see the [LICENSE.md](https://github.com/PurplShip/purplship/blob/master/LICENSE) file for details

## Contributing

We happily welcome contributions, please see [CONTRIBUTING.md](https://github.com/PurplShip/purplship/blob/master/CODE_OF_CONDUCT.md) for details.
