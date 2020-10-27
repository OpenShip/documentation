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
    image: purplship/purplship-server:2020.9.0
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

- Opening `http://0.0.0.0:5002` in a browser should land you at purplship REST OpenAPI documentation page.

![api-ref](../_media/images/api-ref.png)

- Access the administration page to configure your carriers by clicking on the `settings icon`

> ##### Log in the first time
> ![login](../_media/images/login.png)

![login](../_media/images/admin.png)

> ##### Administartion
> From the Administration page, you can:
> - configure a carrier connection
> - create an authentication token for the API endpoint authorization

#### Configure a carrier

Press the Add button under PROVIDERS > [CARRIER] Settings to add a carrier configuration settings.

*For this tutorial, we will add a Canada Post configuration*

![login](../_media/images/configure-a-carrier.png)

!> **Note that these credential are for testing purpose and used only to access Canda Post sandbox server.**

#### Add an Auth token

- Press the Add button under AUTH TOKEN > Tokens to add a token attached to a user.

![login](../_media/images/add-token.png)

- After saving, you should get a valid token

![login](../_media/images/retrieve-token.png)

## PROXY API

The purplship server comes with various components. The lightweight community edition offers stateless shipping service request API.\
The proxy API forwards all calls to carriers without persisting anything.

> *For a full shipment management API and dashboard, see our Enterprise On-prem or Private cloud edition.*

### Fetch shipments rates

<!-- tabs:start -->

#### ** curl **

```shell
curl --request POST \
  --url http://<server-address>/v1/proxy/rates \
  --header 'authorization: Token <your-token>' \
  --header 'content-type: application/json' \
  --data '{
  "recipient": {
    "addressLine1": "125 Church St",
    "personName": "John Doe",
    "companyName": "A corp.",
    "phoneNumber": "514-000-0000",
    "city": "Moncton",
    "countryCode": "CA",
    "postalCode": "E1C4Z8",
    "residential": false,
    "stateCode": "NB"
  },
  "shipper": {
    "addressLine1": "5840 Oak St",
    "personName": "Jane Doe",
    "companyName": "B corp.",
    "phoneNumber": "514-000-0000",
    "city": "Vancouver",
    "countryCode": "CA",
    "postalCode": "V6M2V9",
    "residential": false,
    "stateCode": "BC"
  },
  "parcels": [{
    "weight": 1,
    "packagePreset": "canadapost_corrugated_small_box"
  }],
  "carrierIds": ["canadapost"]
}'
```

#### ** rates **

```json
{
  "rates":[
    {
      "baseCharge":27.36,
      "carrierId":"canadapost",
      "carrierName":"canadapost",
      "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency":"CAD",
      "discount":-0.78,
      "dutiesAndTaxes":3.99,
      "extraCharges":[
        {
          "amount":1.27,
          "currency":"CAD",
          "name":"Fuel surcharge"
        },
        {
          "amount":-2.05,
          "currency":"CAD",
          "name":"SMB Savings"
        }
      ],
      "id":"rat_d6957df533c14cbfa99e99b568ff45ae",
      "service":"canadapost_regular_parcel",
      "totalCharge":30.57,
      "transitDays":9
    },
    {
      "baseCharge":29.64,
      "carrierId":"canadapost",
      "carrierName":"canadapost",
      "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency":"CAD",
      "discount":-0.82,
      "dutiesAndTaxes":4.32,
      "extraCharges":[
        {
          "amount":1.37,
          "currency":"CAD",
          "name":"Fuel surcharge"
        },
        {
          "amount":-2.19,
          "currency":"CAD",
          "name":"SMB Savings"
        }
      ],
      "id":"rat_68933df6c66d4ba4b29944afd0725c1e",
      "service":"canadapost_expedited_parcel",
      "totalCharge":33.14,
      "transitDays":7
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
  "selectedRateId":"rat_d6957df533c14cbfa99e99b568ff45ae",
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
  "rates":[
    {
      "baseCharge":27.36,
      "carrierId":"canadapost",
      "carrierName":"canadapost",
      "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency":"CAD",
      "discount":-0.78,
      "dutiesAndTaxes":3.99,
      "extraCharges":[
        {
          "amount":1.27,
          "currency":"CAD",
          "name":"Fuel surcharge"
        },
        {
          "amount":-2.05,
          "currency":"CAD",
          "name":"SMB Savings"
        }
      ],
      "id":"rat_d6957df533c14cbfa99e99b568ff45ae",
      "service":"canadapost_regular_parcel",
      "totalCharge":30.57,
      "transitDays":9
    },
    {
      "baseCharge":29.64,
      "carrierId":"canadapost",
      "carrierName":"canadapost",
      "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency":"CAD",
      "discount":-0.82,
      "dutiesAndTaxes":4.32,
      "extraCharges":[
        {
          "amount":1.37,
          "currency":"CAD",
          "name":"Fuel surcharge"
        },
        {
          "amount":-2.19,
          "currency":"CAD",
          "name":"SMB Savings"
        }
      ],
      "id":"rat_68933df6c66d4ba4b29944afd0725c1e",
      "service":"canadapost_expedited_parcel",
      "totalCharge":33.14,
      "transitDays":7
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
    "carrierId":"canadapost",
    "carrierName":"canadapost",
    "docImages":[
      null
    ],
    "label":"JVBERi0xLjQKJfbk (Truncated base64) ==",
    "options":{},
    "parcels":[
      {
        "isDocument":false,
        "packagePreset":"canadapost_corrugated_small_box",
        "weight":1.0
      }
    ],
    "payment":{
      "currency":"CAD",
      "paidBy":"sender"
    },
    "rates":[
      {
        "baseCharge":27.36,
        "carrierId":"canadapost",
        "carrierName":"canadapost",
        "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
        "currency":"CAD",
        "discount":-0.78,
        "dutiesAndTaxes":3.99,
        "extraCharges":[
          {
            "amount":1.27,
            "currency":"CAD",
            "name":"Fuel surcharge"
          },
          {
            "amount":-2.05,
            "currency":"CAD",
            "name":"SMB Savings"
          }
        ],
        "id":"rat_d6957df533c14cbfa99e99b568ff45ae",
        "service":"canadapost_regular_parcel",
        "totalCharge":30.57,
        "transitDays":9
      },
      {
        "baseCharge":29.64,
        "carrierId":"canadapost",
        "carrierName":"canadapost",
        "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
        "currency":"CAD",
        "discount":-0.82,
        "dutiesAndTaxes":4.32,
        "extraCharges":[
          {
            "amount":1.37,
            "currency":"CAD",
            "name":"Fuel surcharge"
          },
          {
            "amount":-2.19,
            "currency":"CAD",
            "name":"SMB Savings"
          }
        ],
        "id":"rat_68933df6c66d4ba4b29944afd0725c1e",
        "service":"canadapost_expedited_parcel",
        "totalCharge":33.14,
        "transitDays":7
      }
    ],
    "recipient":{
      "addressLine1":"125 Church St",
      "city":"Moncton",
      "companyName":"A corp.",
      "countryCode":"CA",
      "personName":"John Doe",
      "phoneNumber":"514-000-0000",
      "postalCode":"E1C4Z8",
      "residential":false,
      "stateCode":"NB"
    },
    "selectedRate":{
      "baseCharge":27.36,
      "carrierId":"canadapost",
      "carrierName":"canadapost",
      "carrierRef":"car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency":"CAD",
      "discount":-0.78,
      "dutiesAndTaxes":3.99,
      "extraCharges":[
        {
          "amount":1.27,
          "currency":"CAD",
          "name":"Fuel surcharge"
        },
        {
          "amount":-2.05,
          "currency":"CAD",
          "name":"SMB Savings"
        }
      ],
      "id":"rat_d6957df533c14cbfa99e99b568ff45ae",
      "service":"canadapost_regular_parcel",
      "totalCharge":30.57,
      "transitDays":9
    },
    "selectedRateId":"rat_d6957df533c14cbfa99e99b568ff45ae",
    "service":"canadapost_priority",
    "shipper":{
      "addressLine1":"5840 Oak St",
      "city":"Vancouver",
      "companyName":"B corp.",
      "countryCode":"CA",
      "personName":"Jane Doe",
      "phoneNumber":"514-000-0000",
      "postalCode":"V6M2V9",
      "residential":false,
      "stateCode":"BC"
    },
    "status":"purchased",
    "trackingNumber":"123456789012",
    "trackingUrl":"http://127.0.0.1:8000/v1/proxy/tracking/canadapost/123456789012?test"
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
