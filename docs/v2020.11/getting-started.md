Purplship gets you started easily while offering advanced options for complex carrier services requirements.

## Installation

These instructions will get you started with purplship server in a clean and isolated environment.

- create a configuration file

```shell
echo > docker-compose.yml
```

- Paste this configuration

```yaml
version: '3'

services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_DB: "db"
      POSTGRES_USER: "postgres"
      POSTGRES_PASSWORD: "postgres"
  purpleserver:
    image: purplship/purplship-server:2020.11
    restart: always
    environment:
      - DEBUG_MODE=True
      - ALLOWED_HOSTS=*
      - DATABASE_HOST=db
      - DATABASE_PORT=5432
      - DATABASE_NAME=db
      - DATABASE_USERNAME=postgres
      - DATABASE_PASSWORD=postgres
    ports:
      - "5002:5002"
    depends_on:
      - db
```

- Start the services

```shell
docker-compose up
```

```shell
# [2020-09-16 16:43:01 +0000] [21] [INFO] Starting gunicorn 20.0.4
# [2020-09-16 16:43:01 +0000] [21] [DEBUG] Arbiter booted
# [2020-09-16 16:43:01 +0000] [21] [INFO] Listening at: http://0.0.0.0:5002 (21)
# [2020-09-16 16:43:01 +0000] [21] [INFO] Using worker: sync
# [2020-09-16 16:43:01 +0000] [23] [INFO] Booting worker with pid: 23
# [2020-09-16 16:43:01 +0000] [21] [DEBUG] 1 workers
```

## Configuration

- Opening `http://0.0.0.0:5002` in a browser should land you on purplship web app login page.

![api-ref](../_media/images/web-app-login.png)

- Once loged in
- Access the carrier connection page to connect your carriers

![login](../_media/images/carrier-connection-page.png)

### Configure a carrier

Press the Add button under PROVIDERS > [CARRIER] Settings to add a carrier configuration settings.

*For this tutorial, we will add a Canada Post sandbox connection*

- Press the `Connect a Carrier` button to add a token attached to a user.

![login](../_media/images/connect-carrier.png)

!> **Note that these credential are for testing purpose and used only to access Canda Post sandbox server.**

### Retrieve your API Token

- Access the Settings page to retrieve the token
- Click the reveal buton in the `API Key` section and click
- Click on the token to copy

![login](../_media/images/copy-token.png)

## PROXY API

The purplship server comes with various components. The lightweight community edition offers stateless shipping service request API.\
The proxy API forwards all calls to carriers without persisting anything.

### Fetch shipments rates

<!-- tabs:start -->

#### ** curl **

```shell
curl --request POST \
  --url http://<server-address>/v1/proxy/rates \
  --header 'authorization: Token <your-token>' \
  --header 'content-type: application/json' \
  --data '{
  "carrier_ids": ["canadapost"],
  "recipient": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514 000 0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": false,
    "state_code": "NB"
  },
  "shipper": {
    "address_line1": "5840 Oak St",
    "person_name": "Jane Doe",
    "company_name": "B corp.",
    "phone_number": "514 000 0000",
    "city": "Vancouver",
    "country_code": "CA",
    "postal_code": "V6M2V9",
    "residential": false,
    "state_code": "BC"
  },
  "parcels": [
    {
      "weight": 1,
      "package_preset": "canadapost_corrugated_small_box"
    }
  ],
  "options": {}
}'
```

#### ** rates **

```json
{
  "messages": [],
  "rates": [
    {
      "id": "rat_d720a5ea154b429691f5c0aee3dc5a79",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_regular_parcel",
      "discount": -0.78,
      "base_charge": 27.36,
      "total_charge": 30.57,
      "duties_and_taxes": 3.99,
      "transit_days": 10,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 1.27,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -2.05,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_d3d91f9ec8d94ef390349b9245899b58",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_expedited_parcel",
      "discount": -0.82,
      "base_charge": 29.64,
      "total_charge": 33.14,
      "duties_and_taxes": 4.32,
      "transit_days": 8,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 1.37,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -2.19,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_25ceb695f3b54c2e801c135070718314",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_2nd_day_air",
      "discount": null,
      "base_charge": 68.7,
      "total_charge": 68.7,
      "duties_and_taxes": 0.0,
      "transit_days": null,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_39d644053f3a48e1839bed506af6d96e",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air_saver",
      "discount": null,
      "base_charge": 73.2,
      "total_charge": 73.2,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_ff215017dc3e417b8600f6522a4550f9",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air",
      "discount": null,
      "base_charge": 78.8,
      "total_charge": 78.8,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_d2f92abb999e44e9b8cfdee692248a42",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_xpresspost",
      "discount": -0.99,
      "base_charge": 75.82,
      "total_charge": 86.05,
      "duties_and_taxes": 11.22,
      "transit_days": 3,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 3.56,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -4.55,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_72a3ce61adc14322a54dd75c1efc3b91",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air_early",
      "discount": null,
      "base_charge": 113.92,
      "total_charge": 113.92,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_fd2d35d1611a4ff5b2a650f29e9d7963",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_priority",
      "discount": -2.29,
      "base_charge": 101.83,
      "total_charge": 114.47,
      "duties_and_taxes": 14.93,
      "transit_days": 3,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 4.74,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -7.03,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    }
  ]
}
```

<!-- tabs:end -->

### Buy a shipment label

You can now submit the shipment by selecting your preferred rate from the previous call.

<!-- tabs:start -->

#### ** curl **

```shell
curl --request POST \
  --url http://<server-address>/v1/proxy/shipping \
  --header 'authorization: Token <your-token>' \
  --header 'content-type: application/json' \
  --data '{
  "carrier_ids": ["canadapost"],
  "selectedRateId":"rat_d720a5ea154b429691f5c0aee3dc5a79",
  "recipient":{
    "addressLine1":"125 Church St",
    "personName":"John Doe",
    "companyName":"A corp.",
    "phoneNumber":"514-000-0000",
    "city":"Moncton",
    "countryCode":"CA",
    "postalCode":"E1C4Z8",
    "residential":false,
    "stateCode":"NB"
  },
  "shipper":{
    "addressLine1":"5840 Oak St",
    "personName":"Jane Doe",
    "companyName":"B corp.",
    "phoneNumber":"514-000-0000",
    "city":"Vancouver",
    "countryCode":"CA",
    "postalCode":"V6M2V9",
    "residential":false,
    "stateCode":"BC"
  },
  "parcels":[
    {
      "weight":1,
      "packagePreset":"canadapost_corrugated_small_box"
    }
  ],
  "rates": [
    {
      "id": "rat_d720a5ea154b429691f5c0aee3dc5a79",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_regular_parcel",
      "discount": -0.78,
      "base_charge": 27.36,
      "total_charge": 30.57,
      "duties_and_taxes": 3.99,
      "transit_days": 10,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 1.27,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -2.05,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_d3d91f9ec8d94ef390349b9245899b58",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_expedited_parcel",
      "discount": -0.82,
      "base_charge": 29.64,
      "total_charge": 33.14,
      "duties_and_taxes": 4.32,
      "transit_days": 8,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 1.37,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -2.19,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_25ceb695f3b54c2e801c135070718314",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_2nd_day_air",
      "discount": null,
      "base_charge": 68.7,
      "total_charge": 68.7,
      "duties_and_taxes": 0.0,
      "transit_days": null,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_39d644053f3a48e1839bed506af6d96e",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air_saver",
      "discount": null,
      "base_charge": 73.2,
      "total_charge": 73.2,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_ff215017dc3e417b8600f6522a4550f9",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air",
      "discount": null,
      "base_charge": 78.8,
      "total_charge": 78.8,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_d2f92abb999e44e9b8cfdee692248a42",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_xpresspost",
      "discount": -0.99,
      "base_charge": 75.82,
      "total_charge": 86.05,
      "duties_and_taxes": 11.22,
      "transit_days": 3,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 3.56,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -4.55,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    },
    {
      "id": "rat_72a3ce61adc14322a54dd75c1efc3b91",
      "carrier_name": "ups_package",
      "carrier_id": "ups",
      "currency": "CAD",
      "service": "ups_next_day_air_early",
      "discount": null,
      "base_charge": 113.92,
      "total_charge": 113.92,
      "duties_and_taxes": 0.0,
      "transit_days": 1,
      "extra_charges": [
        {
          "name": null,
          "amount": 0.0,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_62d1bfef31834461a85676ec2e393ea6",
      "test_mode": true
    },
    {
      "id": "rat_fd2d35d1611a4ff5b2a650f29e9d7963",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_priority",
      "discount": -2.29,
      "base_charge": 101.83,
      "total_charge": 114.47,
      "duties_and_taxes": 14.93,
      "transit_days": 3,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 4.74,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -7.03,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_814aa5a4390547d2b47447c125d3f91d",
      "test_mode": true
    }
  ],
  "payment":{
    "currency":"CAD",
    "paidBy":"sender"
  }
}'
```

#### ** shipment **

```json
{
  "shipment":{
    "id": "shp_c255219c89504f4887c241acd481fefe",
    "status": "purchased",
    "carrier_name": "canadapost",
    "carrier_id": "canadapost",
    "label":"JVBERi0xLjQKJfbk (Truncated base64) ==",
    "tracking_number": "123456789012",
    "shipment_identifier": "123456789012",
    "selected_rate": {
      "id": "rat_516f2858ffe5460a9a2be6dd34d9818b",
      "carrier_name": "canadapost",
      "carrier_id": "canadapost",
      "currency": "CAD",
      "service": "canadapost_regular_parcel",
      "discount": -0.78,
      "base_charge": 27.36,
      "total_charge": 30.57,
      "duties_and_taxes": 3.99,
      "transit_days": 10,
      "extra_charges": [
        {
          "name": "Fuel surcharge",
          "amount": 1.27,
          "currency": "CAD"
        },
        {
          "name": "SMB Savings",
          "amount": -2.05,
          "currency": "CAD"
        }
      ],
      "meta": null,
      "carrier_ref": "car_86e77d08a5fe480599006794e1551f1c",
      "test_mode": true
    },
    "selected_rate_id": "rat_516f2858ffe5460a9a2be6dd34d9818b",
    "rates": [
      {
        "id": "rat_516f2858ffe5460a9a2be6dd34d9818b",
        "carrier_name": "canadapost",
        "carrier_id": "canadapost",
        "currency": "CAD",
        "service": "canadapost_regular_parcel",
        "discount": -0.78,
        "base_charge": 27.36,
        "total_charge": 30.57,
        "duties_and_taxes": 3.99,
        "transit_days": 10,
        "extra_charges": [
          {
            "name": "Fuel surcharge",
            "amount": 1.27,
            "currency": "CAD"
          },
          {
            "name": "SMB Savings",
            "amount": -2.05,
            "currency": "CAD"
          }
        ],
        "meta": null,
        "carrier_ref": "car_86e77d08a5fe480599006794e1551f1c",
        "test_mode": true
      },
      {
        "id": "rat_a2a34ba2c43641f397308948f4cda8ae",
        "carrier_name": "canadapost",
        "carrier_id": "canadapost",
        "currency": "CAD",
        "service": "canadapost_expedited_parcel",
        "discount": -0.82,
        "base_charge": 29.64,
        "total_charge": 33.14,
        "duties_and_taxes": 4.32,
        "transit_days": 8,
        "extra_charges": [
          {
            "name": "Fuel surcharge",
            "amount": 1.37,
            "currency": "CAD"
          },
          {
            "name": "SMB Savings",
            "amount": -2.19,
            "currency": "CAD"
          }
        ],
        "meta": null,
        "carrier_ref": "car_86e77d08a5fe480599006794e1551f1c",
        "test_mode": true
      },
      {
        "id": "rat_95bfe0bb3a7645d7889edce0200fa64d",
        "carrier_name": "canadapost",
        "carrier_id": "canadapost",
        "currency": "CAD",
        "service": "canadapost_xpresspost",
        "discount": -0.99,
        "base_charge": 75.82,
        "total_charge": 86.05,
        "duties_and_taxes": 11.22,
        "transit_days": 3,
        "extra_charges": [
          {
            "name": "Fuel surcharge",
            "amount": 3.56,
            "currency": "CAD"
          },
          {
            "name": "SMB Savings",
            "amount": -4.55,
            "currency": "CAD"
          }
        ],
        "meta": null,
        "carrier_ref": "car_86e77d08a5fe480599006794e1551f1c",
        "test_mode": true
      },
      {
        "id": "rat_19584bf3df4848f68e6e2c5b0c2e14ff",
        "carrier_name": "canadapost",
        "carrier_id": "canadapost",
        "currency": "CAD",
        "service": "canadapost_priority",
        "discount": -2.29,
        "base_charge": 101.83,
        "total_charge": 114.47,
        "duties_and_taxes": 14.93,
        "transit_days": 3,
        "extra_charges": [
          {
            "name": "Fuel surcharge",
            "amount": 4.74,
            "currency": "CAD"
          },
          {
            "name": "SMB Savings",
            "amount": -7.03,
            "currency": "CAD"
          }
        ],
        "meta": null,
        "carrier_ref": "car_86e77d08a5fe480599006794e1551f1c",
        "test_mode": true
      }
    ],
    "tracking_url": "/v1/proxy/tracking/canadapost/123456789012?test",
    "service": "canadapost_regular_parcel",
    "shipper": {
      "id": null,
      "postal_code": "V6M2V9",
      "city": "Vancouver",
      "federal_tax_id": null,
      "state_tax_id": null,
      "person_name": "Jane Doe",
      "company_name": "B corp.",
      "country_code": "CA",
      "email": null,
      "phone_number": "514 000 0000",
      "state_code": "BC",
      "suburb": null,
      "residential": false,
      "address_line1": "5840 Oak St",
      "address_line2": ""
    },
    "recipient": {
      "id": null,
      "postal_code": "E1C4Z8",
      "city": "Moncton",
      "federal_tax_id": null,
      "state_tax_id": null,
      "person_name": "John Doe",
      "company_name": "A corp.",
      "country_code": "CA",
      "email": null,
      "phone_number": "514 000 0000",
      "state_code": "NB",
      "suburb": null,
      "residential": false,
      "address_line1": "125 Church St",
      "address_line2": ""
    },
    "parcels": [
      {
        "id": null,
        "weight": 1.0,
        "width": null,
        "height": null,
        "length": null,
        "packaging_type": null,
        "package_preset": "canadapost_corrugated_small_box",
        "description": null,
        "content": null,
        "is_document": false,
        "weight_unit": null,
        "dimension_unit": null
      }
    ],
    "services": [],
    "options": {},
    "payment": {
      "id": null,
      "paid_by": "sender",
      "amount": null,
      "currency": "CAD",
      "account_number": null,
      "credit_card": null,
      "contact": null
    },
    "customs": null,
    "doc_images": [],
    "reference": "",
    "carrier_ids": [],
    "meta": null,
    "created_at": "2020-10-27 03:37:15.342905",
    "test_mode": true
  }
}
```

<!-- tabs:end -->

### Print your label

```shell
curl --request POST \
  --url http://127.0.0.1:8000/v1/labels \
  --header 'authorization: Token 19707922d97cef7a5d5e17c331ceeff66f226660' \
  --header 'content-type: application/json' \
  --data '{
  "name": "shipment-test",
  "label": "JVBERi0xLjQKJfbk (Truncated base64) =="
}'
```

> ![login](../_media/images/label.png)
