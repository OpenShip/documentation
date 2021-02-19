# Proxy APIs <!-- {docsify-ignore} -->

In some scenarios, all we need is to send request to a carrier using the Purplship unified API.
The Proxy API comes handy for that as it turn Purplship into a simple middleware that converts
and validate your request and simply forward it to the shipping carrier server.

!>   **Note** \
*When using the proxy API, no objects are created in the Purplship system.*

|        | Endpoints                                           |
:--------|:----------------------------------------------------|
|`POST`  | /v1/proxy/rates                                     |
|`POST`  | /v1/proxy/shipping                                  |
|`POST`  | /v1/proxy/shipping/{carrier_name}/cancel            |
|`PATCH` | /v1/proxy/pickups/{carrier_name}                    |
|`POST`  | /v1/proxy/pickups/{carrier_name}                    |
|`POST`  | /v1/proxy/pickups/{carrier_name}/cancel             |
|`POST`  | /v1/proxy/tracking/{carrier_name}/{tracking_number} |

## Fetch Rates

This operation retrieves shipment quotes with the services available based on the shipping and destination address provided as well as the parcel weight and dimensions.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Proxy.fetch_rates({
  "recipient": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": False,
    "state_code": "NB"
  },
  "shipper": {
    "address_line1": "5840 Oak St",
    "person_name": "Jane Doe",
    "company_name": "B corp.",
    "phone_number": "514-000-0000",
    "city": "Vancouver",
    "country_code": "CA",
    "postal_code": "V6M2V9",
    "residential": False,
    "state_code": "BC"
  },
  "parcels": [
    {
      "weight": 0.2,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": True,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ]
})
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->proxy->fetchRates([
    "shipper" => [
        "address_line1" => "5840 Oak St",
        "person_name" => "Jane Doe",
        "phone_number" => "1 438 222-2222",
        "city" => "Montreal",
        "country_code" => "CA",
        "postal_code" => "V6M2V9",
        "residential" => False,
        "state_code" => "BC",
        "company_name" => "B corp."
    ],
    "recipient" => [
        "address_line1" => "125 Church St",
        "person_name" => "Johm Doe",
        "phone_number" => "1 438 222-2222",
        "city" => "Moncton",
        "country_code" => "CA",
        "postal_code" => "E1C4Z8",
        "residential" => False,
        "state_code" => "NB",
        "company_name" => "A corp."
    ],
    "parcels" => array(
        0 => [
          "weight" => 0.5,
          "width" => 10,
          "height" => 10,
          "length" => 1,
          "packaging_type" => "envelope",
          "is_document" => True,
          "weight_unit" => "KG",
          "dimension_unit" => "CM"
        ]
    )
]);
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.fetchRates({
  "recipient": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
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
    "phone_number": "514-000-0000",
    "city": "Vancouver",
    "country_code": "CA",
    "postal_code": "V6M2V9",
    "residential": false,
    "state_code": "BC"
  },
  "parcels": [
    {
      "weight": 0.2,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": true,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ]
});
```

<!-- tabs:end -->

</details>

---

## Buy Label

Once you retrieve shipments quotes, you can buy a shipping label using your preferred cost/service option.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Proxy.buy_label({
  "selected_rate_id":"<rat_id>",
  "recipient":{
    "address_line1":"125 Church St",
    "person_name":"John Doe",
    "company_name":"A corp.",
    "phone_number":"514-000-0000",
    "city":"Moncton",
    "country_code":"CA",
    "postal_code":"E1C4Z8",
    "residential":False,
    "state_code":"NB"
  },
  "shipper":{
    "address_line1":"5840 Oak St",
    "person_name":"Jane Doe",
    "company_name":"B corp.",
    "phone_number":"514-000-0000",
    "city":"Vancouver",
    "country_code":"CA",
    "postal_code":"V6M2V9",
    "residential":False,
    "state_code":"BC"
  },
  "parcels":[
    {
      "weight":1,
      "package_preset":"canadapost_corrugated_small_box"
    }
  ],
  "carrier_ids":[],
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
      "id":"<rat_id>",
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
})
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->proxy->buyLabel([
  "selected_rate_id" => "<rat_id>",
  "recipient" => [
    "address_line1" => "125 Church St",
    "person_name" => "John Doe",
    "company_name" => "A corp.",
    "phone_number" => "514-000-0000",
    "city" => "Moncton",
    "country_code" => "CA",
    "postal_code" => "E1C4Z8",
    "residential" => False,
    "state_code" => "NB"
  ],
  "shipper" => [
    "address_line1" => "5840 Oak St",
    "person_name" => "Jane Doe",
    "company_name" => "B corp.",
    "phone_number" => "514-000-0000",
    "city" => "Vancouver",
    "country_code" => "CA",
    "postal_code" => "V6M2V9",
    "residential" => False,
    "state_code" => "BC"
  ],
  "parcels" => array(
    [
      "weight" => 1,
      "package_preset" => "canadapost_corrugated_small_box"
    ]
  ),
  "carrier_ids" => array(),
  "rates" => array(
    [
      "baseCharge" => 27.36,
      "carrierId" => "canadapost",
      "carrierName" => "canadapost",
      "carrierRef" => "car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency" => "CAD",
      "discount" => -0.78,
      "dutiesAndTaxes" => 3.99,
      "extraCharges" => array(
        [
          "amount" => 1.27,
          "currency" => "CAD",
          "name" => "Fuel surcharge"
        ],
        [
          "amount" => -2.05,
          "currency" => "CAD",
          "name" => "SMB Savings"
        ]
      ),
      "id" => "<rat_id>",
      "service" => "canadapost_regular_parcel",
      "totalCharge" => 30.57,
      "transitDays" => 9
    ],
    [
      "baseCharge" => 29.64,
      "carrierId" => "canadapost",
      "carrierName" => "canadapost",
      "carrierRef" => "car_317d118f6b2b4fd7875f6934df7e8b08",
      "currency" => "CAD",
      "discount" => -0.82,
      "dutiesAndTaxes" => 4.32,
      "extraCharges" => array(
        [
          "amount" => 1.37,
          "currency" => "CAD",
          "name" => "Fuel surcharge"
        ],
        [
          "amount" => -2.19,
          "currency" => "CAD",
          "name" => "SMB Savings"
        ]
      ),
      "id" => "rat_68933df6c66d4ba4b29944afd0725c1e",
      "service" => "canadapost_expedited_parcel",
      "totalCharge" => 33.14,
      "transitDays" => 7
    ]
  )
]);
```

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.buyLabel({
  "selected_rate_id":"<rat_id>",
  "recipient":{
    "address_line1":"125 Church St",
    "person_name":"John Doe",
    "company_name":"A corp.",
    "phone_number":"514-000-0000",
    "city":"Moncton",
    "country_code":"CA",
    "postal_code":"E1C4Z8",
    "residential": false,
    "state_code":"NB"
  },
  "shipper":{
    "address_line1":"5840 Oak St",
    "person_name":"Jane Doe",
    "company_name":"B corp.",
    "phone_number":"514-000-0000",
    "city":"Vancouver",
    "country_code":"CA",
    "postal_code":"V6M2V9",
    "residential": false,
    "state_code":"BC"
  },
  "parcels":[
    {
      "weight":1,
      "package_preset":"canadapost_corrugated_small_box"
    }
  ],
  "carrier_ids":[],
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
      "id":"<rat_id>",
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
});
```

<!-- tabs:end -->

> **IMPORTANT** \
\
Notice two key elements here: `selected_rate_id` and `rates`.
The Purplship Shipping service being stateless, it is important to inform Purplship of the previously retrieve rates as well as your preferred one.

!> **Note** \
\
Tampering with the rates charges is useless since carriers provide them for information purpose. \
At the end of the day you will be charged for the exact weight and or size of the package once in the hands of the shipping carrier.

</details>

---

## Void Label

When you don't intend to use a label anymore, it is adviced to send a request to void the label. That will notify the carrier of your intention to not use the previously printed label and in some case receive a refund if your account was charged.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.void_label(
  { "shipment_identifier": "123456789012345678" },
  'carrier_name'
)
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$request = [
  "shipment_identifier" => "123456789012345678"
];
$purplship->shipments->voidLabel($request, 'carrier_name');
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
const request = {
  "shipment_identifier": "123456789012345678"
};

purplship.shipments.voidLabel(request, 'carrier_name');
```

<!-- tabs:end -->

</details>

---

## Track Shipment

Send tracking requests to retrieve in real time a package shipment progress.

<details>
<summary>Code Sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Proxy.trackShipment('carrier_name', 'tracking_numner', test=True)
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->proxy->trackShipment('carrier_name', 'tracking_number', True);
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.trackShipment('carrier_name', 'tracking_numner', true);
```

<!-- tabs:end -->

</details>

---

## Schedule Pickup

Send a request to schedule a pickup request from your carrier.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Proxy.schedulePickup({
  "pickup_date": "2020-10-25",
  "address": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": False,
    "state_code": "NB",
    "email": "john@a.com"
  },
  "parcels": [
    {
      "weight": 0.5,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": True,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ],
  "ready_time": "13:00",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall"
}, 'carrier_name')
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$request = [
  "pickup_date" => "2020-10-25",
  "address" => [
    "address_line1" => "125 Church St",
    "person_name" => "John Doe",
    "company_name" => "A corp.",
    "phone_number" => "514-000-0000",
    "city" => "Moncton",
    "country_code" => "CA",
    "postal_code" => "E1C4Z8",
    "residential" => False,
    "state_code" => "NB",
    "email" => "john@a.com"
  ],
  "parcels" => array(
    [
      "weight" => 0.5,
      "width" => 10,
      "height" => 10,
      "length" => 1,
      "packaging_type" => "envelope",
      "is_document" => True,
      "weight_unit" => "KG",
      "dimension_unit" => "CM"
    ]
  ),
  "ready_time" => "13:00",
  "closing_time" => "17:00",
  "instruction" => "Should not be folded",
  "package_location" => "At the main entrance hall"
];

$purplship->proxy->schedulePickup($request, 'carrier_name');
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.schedulePickup({
  "pickup_date": "2020-10-25",
  "address": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": false,
    "state_code": "NB",
    "email": "john@a.com"
  },
  "parcels": [
    {
      "weight": 0.5,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": true,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ],
  "ready_time": "13:00",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall"
}, 'carrier_name');
```

<!-- tabs:end -->

</details>

---

## Update Pickup

Send a request to update a pickup previously scheduled if any changes is required.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

request = {
  "pickup_date": "2020-10-23",
  "confirmation_number": "27241",
  "address": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": False,
    "state_code": "NB",
    "email": "john@a.com"
  },
  "parcels": [
    {
      "weight": 0.2,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": True,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ],
  "ready_time": "14:30",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall"
}

purplship.Proxy.update_pickup(request, 'carrier_name')
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$request = [
  "pickup_date" => "2020-10-23",
  "confirmation_number" => "27241",
  "address" => [
    "address_line1" => "125 Church St",
    "person_name" => "John Doe",
    "company_name" => "A corp.",
    "phone_number" => "514-000-0000",
    "city" => "Moncton",
    "country_code" => "CA",
    "postal_code" => "E1C4Z8",
    "residential" => False,
    "state_code" => "NB",
    "email" => "john@a.com"
  ],
  "parcels" => array(
    [
      "weight" => 0.2,
      "width" => 10,
      "height" => 10,
      "length" => 1,
      "packaging_type" => "envelope",
      "is_document" => True,
      "weight_unit" => "KG",
      "dimension_unit" => "CM"
    ]
  ),
  "ready_time" => "14:30",
  "closing_time" => "17:00",
  "instruction" => "Should not be folded",
  "package_location" => "At the main entrance hall"
];

$purplship->proxy->udpatePickup($request, 'carrier_name');
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.updatePickup({
  "pickup_date": "2020-10-23",
  "confirmation_number": "27241",
  "address": {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": false,
    "state_code": "NB",
    "email": "john@a.com"
  },
  "parcels": [
    {
      "weight": 0.2,
      "width": 10,
      "height": 10,
      "length": 1,
      "packaging_type": "envelope",
      "is_document": true,
      "weight_unit": "KG",
      "dimension_unit": "CM"
    }
  ],
  "ready_time": "14:30",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall"
}, 'carrier_name');
```

<!-- tabs:end -->

</details>

---

## Cancel Pickup

When a pickup is not required anymore, the cancel pickup API notifies the carrier.

<details>
<summary>Code sample</summary>

<!-- tabs:start -->

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Proxy.cancel_pickup(
  { "confirmation_number": "00110215" },
  'carrier_name'
)
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->proxy->cancelPickup(
  [ "confirmation_number" => "00110215" ],
  'carrier_name'
);
```

### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.proxy.cancelPickup(
  { "confirmation_number": "00110215" },
  'carrier_name'
);
```

<!-- tabs:end -->

</details>
