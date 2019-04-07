# Welcome to PurplShip

[![Build Status](https://travis-ci.org/PurplShip/purplship.svg?branch=master)](https://travis-ci.org/PurplShip/purplship) [![codecov](https://codecov.io/gh/PurplShip/purplship/branch/master/graph/badge.svg)](https://codecov.io/gh/PurplShip/purplship) [![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

## Overview

PurplShip is an open source library that makes shipping carrier API integration
easy.
PurplShip proposes an intuitive unified API, to make multi-carrier integration seamless.

- Integrate multiple carriers: DHL, FedEx, UPS, Canada Post and more with ease
- Use an intuitive, unified API across multiple carriers
- Use your developer credentials and your negotiated rates

PurplShip helps quickly getting started with shipping services as it is easy to use:

```python
import purplship

dhl = purplship.gateway['dhl'].create({
    "site_id": "username",
    "password": "password"
})

response = purplship.rating.fetch({
    "shipper": {"postal_code": "H3N1S4", "country_code": "CA"},
    "recipient": {"city": "Lome", "country_code": "TG"},
    "shipment": {
        "items": [
            {"height": 3, "length": 10, "width": 3, "weight": 4.0}
        ]
    }
}).from_(dhl)

rates = response.parse()

from gds_helpers import to_dict

print(to_dict(rates))
```

```json
[
    [], //Errors
    [   //Rates
        {
            "base_charge": 62.66,
            "carrier": "DHL",
            "currency": "CAD",
            "delivery_date": "2018-10-25 10:30:00",
            "discount": 0,
            "duties_and_taxes": 0,
            "extra_charges": [
                {
                    "amount": 8.0,
                    "currency": "CAD",
                    "name": "10:30 PREMIUM"
                },
                {
                    "amount": 5.12,
                    "currency": "CAD",
                    "name": "FUEL SURCHARGE"
                }
            ],
            "service_name": "EXPRESS 10:30 DOC",
            "service_type": "TD",
            "total_charge": 75.78
        },
        {
            "base_charge": 62.66,
            "carrier": "DHL",
            "currency": "CAD",
            "delivery_date": "2018-10-25 11:59:00",
            "discount": 0,
            "duties_and_taxes": 0,
            "extra_charges": [
                {
                    "amount": 4.54,
                    "currency": "CAD",
                    "name": "FUEL SURCHARGE"
                }
            ],
            "service_name": "EXPRESS WORLDWIDE DOC",
            "service_type": "TD",
            "total_charge": 67.2
        }
    ]
]
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

## Table of content

- Basic
    - [Rating](basic/rating)
    - [Tracking](basic/tracking)
    - [Shipping](basic/shipping)
    - [Pickup](basic/pickup)
    - [Fluent API](basic/fluent-api)
- Carriers
    - [Australia Post](carriers/aups)
    - [Canada Post](carriers/caps)
    - [DHL](carriers/dhl)
    - [FedEx](carriers/fedex)
    - [Sendle](carriers/sendle)
    - [UPS](carriers/ups)
- Advanced
    - [Single Carrier](advanced/carrier)
    - [Multi Carrier](advanced/multi-carrier)
    - [Extra](advanced/extra)
    - [Default](advanced/default)
    - [Shipping Options](advanced/options)
    - [Freight](advanced/freight)
    - [Healthcare](advanced/health)
- Contributing
    - [Architecture](contributing/architecture)
- [Use case](usage)
- [Roadmap](roadmap)
- [FAQ](faq)

## License

This project is licensed under the LGPL v3 License - see the [LICENSE.md](https://github.com/PurplShip/purplship/blob/master/LICENSE) file for details

## Contributing

We happily welcome contributions, please see [CONTRIBUTING.md](https://github.com/PurplShip/purplship/blob/master/CODE_OF_CONDUCT.md) for details.
