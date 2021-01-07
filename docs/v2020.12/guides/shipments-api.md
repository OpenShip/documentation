# Shipments API <!-- {docsify-ignore} -->

## Shipments

|        | Endpoints                                           |
:--------|:--------------------------------------------------- |
`GET`    | /v1/shipments                                       |
`POST`   | /v1/shipments                                       |
`GET`    | /v1/shipments/{id}                                  |
`DELETE` | /v1/shipments/{id}/cancel                           |
`POST`   | /v1/shipments/{id}/options                          |
`POST`   | /v1/shipments/{id}/purchase                         |
`GET`    | /v1/shipments/{id}/rates                            |
`GET`    | /v1/shipment_pickups                                |
`GET`    | /v1/shipment_pickups/{id}                           |
`POST`   | /v1/shipment_pickups/{carrier_name}/schedule        |
`PATCH`  | /v1/shipment_pickups/{id}                           |
`POST`   | /v1/shipment_pickups/{carrier_name}/cancel          |
`GET`    | /v1/tracking_status                                 |
`GET`    | /v1/tracking_status/{carrier_name}/{tracking_number}|
`POST`   | /v1/shipments/{id}/customs                          |

<details>
<summary>Shipments API Usage</summary>

- ### Retrieve shipments

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.list()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->list();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.list();
```

<!-- tabs:end -->

- ### Create a shipment

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.create({
  "recipient":{
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
  "shipper":{
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
  "parcels":[
    {
        "weight": 0.2,
        "width": 10,
        "height": 10,
        "length": 1,
        "packaging_type": "pak",
        "is_document": False,
        "weight_unit": "KG",
        "dimension_unit": "CM"
    }
  ]
})
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->create([
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
        "weight" => 0.2,
        "width" => 10,
        "height" => 10,
        "length" => 1,
        "packaging_type" => "pak",
        "is_document" => False,
        "weight_unit" => "KG",
        "dimension_unit" => "CM"
    ]
  )
]);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.create({
  "recipient":{
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
  "shipper":{
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
  "parcels":[
    {
        "weight": 0.2,
        "width": 10,
        "height": 10,
        "length": 1,
        "packaging_type": "pak",
        "is_document": false,
        "weight_unit": "KG",
        "dimension_unit": "CM"
    }
  ]
});
```

<!-- tabs:end -->

- ### Retrieve a shipment

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.retrieve('<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->retrieve('<shp_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.retrieve('<shp_id>');
```

<!-- tabs:end -->

- ### Add shipment options

This service allow the submission and modification of the options provided for the shipment.
Shipment options are various check your instance API reference for a full list of options available for each carrier.

> e.g.

```json
{
  "insurance": 54
}
```

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.set_options({
    "insurance": 54,
    "currency": "CAD"
}, '<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->setOptions([
    "insurance" => 54,
    "currency" => "CAD"
], '<shp_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.setOptions({
    "insurance": 54,
    "currency": "CAD"
}, '<shp_id>');
```

<!-- tabs:end -->

- ### Buy a shipment label

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.purchase({
  "selected_rate_id": "<rat_id>",
  "payment": {
      "paid_by": "sender"
  }
}, '<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->purchase(
  [
    "selected_rate_id" => "<rat_id>",
    "payment" => [
        "paid_by" => "sender"
    ]
  ],
  '<shp_id>'
);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.purchase({
  "selected_rate_id": "<rat_id>",
  "payment": {
      "paid_by": "sender"
  }
}, '<shp_id>');
```

<!-- tabs:end -->

- ### Refresh a shipment rates

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.rates('<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->rates('<shp_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.rates('<shp_id>');
```

<!-- tabs:end -->

- ### Cancel a shipment

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.cancel('<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->cancel('<shp_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.cancel('<shp_id>');
```

<!-- tabs:end -->

- ### Retrieve scheduled shipment pickups

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.pickups()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->pickups();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.pickups();
```

<!-- tabs:end -->

- ### Schedule a pickup for one or many shipments

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.schedule_pickup({
  "pickup_date": "2020-10-25",
  "ready_time": "13:00",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall",
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
  "tracking_numbers": [
    "tracking_number",
    "tracking_number",
    "tracking_number"
  ]
}, 'carrier_name')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$request = [
  "pickup_date" => "2020-10-25",
  "ready_time" => "13:00",
  "closing_time" => "17:00",
  "instruction" => "Should not be folded",
  "package_location" => "At the main entrance hall",
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
  "tracking_numbers" => array(
    "tracking_number",
    "tracking_number",
    "tracking_number"
  )
];

$purplship->shipments->schedulePickup($request, 'carrier_name');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
const request = {
  "pickup_date": "2020-10-25",
  "ready_time": "13:00",
  "closing_time": "17:00",
  "instruction": "Should not be folded",
  "package_location": "At the main entrance hall",
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
  "tracking_numbers": [
    "tracking_number",
    "tracking_number",
    "tracking_number"
  ]
};

purplship.shipments.schedulePickup(request, 'carrier_name');
```

<!-- tabs:end -->

- ### Retrieve a scheduled pickup

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.retrieve_pickup('<pck_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->retrievePickup('<pck_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.retrievePickup('<pck_id>');
```

<!-- tabs:end -->

- ### Update a pickup for one or more shipments

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.update_pickup(
  {
    "ready_time": "14:00",
    "package_location": "At the main entrance hall next to the distributor",
    "address": {
      "person_name": "Janet Jackson"
    }
  },
  '<pck_id>'
)
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$request = [
  "ready_time" => "14:00",
  "package_location" => "At the main entrance hall next to the distributor",
  "address" => [
    "person_name" => "Janet Jackson"
  ]
];

$purplship->shipments->updatePickup($request, '<pck_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
const request = {
  "ready_time": "14:00",
  "package_location": "At the main entrance hall next to the distributor",
  "address": {
    "person_name": "Janet Jackson"
  }
};

purplship.shipments.updatePickup(request, '<pck_id>');
```

<!-- tabs:end -->

- ### Cancel a pickup for one or more shipments

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.cancel_pickup('<pck_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->cancelPickup('<pck_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.cancelPickup('<pck_id>');
```

<!-- tabs:end -->

- ### Retrieve tracked shipment statuses

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.tracking_statuses()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->trackingStatuses();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.tracking_statuses();
```

<!-- tabs:end -->

- ### Retrieve a shipment tracking status

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.track('<carrier_name>', '<tracking_number>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->track('<carrier_name>', '<tracking_number>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.track('<carrier_name>', '<tracking_number>');
```

<!-- tabs:end -->

- ### Add a custom declaration to an existing shipment

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.add_customs(
  {
    "incoterm": "FCA",
    "content_type": "documents"
  },
  '<shp_id>'
)
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$request = [
    "incoterm" => "FCA",
    "content_type" => "documents"
];

$purplship->shipments->addCustoms($request, '<shp_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
const request = {
    "incoterm": "FCA",
    "content_type": "documents"
};

purplship.shipments.addCustoms(request, '<shp_id>');
```

<!-- tabs:end -->

</details>

---

## Addresses

|       | Endpoints          |
:-------|:------------------ |
`GET`   | /v1/addresses      |
`POST`  | /v1/addresses      |
`GET`   | /v1/addresses/{id} |
`PATCH` | /v1/addresses/{id} |

This is an object representing your Purplship shipping address. \
You can create, update and retrieve one or many addresses stored on your Purplship account.

<details>
<summary>Addresses API Usage</summary>

- ### Retrieve addresses

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Addresses.list()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->addresses->list();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.list();
```

<!-- tabs:end -->

- ### Create an address

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Addresses.create({
    "address_line1": "5205 rue riviera",
    "person_name": "Jane Doe",
    "phone_number": "1 438 222-2222",
    "city": "Montreal",
    "country_code": "CA",
    "postal_code": "H8Z2Z3",
    "residential": True,
    "state_code": "QC"
})
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->addresses->create([
    "address_line1" => "5205 rue riviera",
    "person_name" => "Jane Doe",
    "phone_number" => "1 438 222-2222",
    "city" => "Montreal",
    "country_code" => "CA",
    "postal_code" => "H8Z2Z3",
    "residential" => True,
    "state_code" => "QC"
]);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.create({
    "address_line1": "5205 rue riviera",
    "person_name": "Jane Doe",
    "phone_number": "1 438 222-2222",
    "city": "Montreal",
    "country_code": "CA",
    "postal_code": "H8Z2Z3",
    "residential": true,
    "state_code": "QC"
});
```

<!-- tabs:end -->

- ### Retrieve an address

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Addresses.retrieve('<addr_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->addresses->retrieve('<addr_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.retrieve('<addr_id>');
```

<!-- tabs:end -->

- ### Update an address

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Addresses.update(
    { "phone_number": "1 438 222-2222" },
    '<addr_id>'
)
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->addresses->update(
    [ "phone_number" => "1 438 222-2222" ],
    '<addr_id>'
);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.update(
    { "phone_number": "1 438 222-2222" },
    '<addr_id>'
);
```

<!-- tabs:end -->

</details>

---

## Parcels

|       | Endpoints        |
:-------|:-----------------|
`GET`   | /v1/parcels      |
`POST`  | /v1/parcels      |
`GET`   | /v1/parcels/{id} |
`PATCH` | /v1/parcels/{id} |
`DELETE`| /v1/parcels/{id} |

This is an object representing your Purplship parcel. \
You can create, update and retrieve one or many parcels stored on your Purplship account.

<details>
<summary>Parcels API Usage</summary>

- ### Retrieve parcels

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Parcels.list()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->parcels->list();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.list();
```

<!-- tabs:end -->

- ### Create a parcel

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Parcels.create({
    "weight": 1,
    "width": 20,
    "height": 10,
    "length": 29,
    "weight_unit": "KG",
    "dimension_unit": "CM"
})
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->parcels->create([
    "weight" => 1,
    "width" => 20,
    "height" => 10,
    "length" => 29,
    "weight_unit" => "KG",
    "dimension_unit" => "CM"
]);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.create({
    "weight": 1,
    "width": 20,
    "height": 10,
    "length": 29,
    "weight_unit": "KG",
    "dimension_unit": "CM"
});
```

<!-- tabs:end -->

- ### Retrieve a parcel

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Parcels.retrieve('<parcl_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->parcels->retrieve('<parcl_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.retrieve('<parcl_id>');
```

<!-- tabs:end -->

- ### Update a parcel

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Parcels.update(
    {
        "weight": 1,
        "weight_unit": "LB"
    },
    '<parcl_id>'
)
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->parcels->update(
    [
        "weight" => 1.5,
        "weight_unit" => "LB"
    ],
    '<parcl_id>'
);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.update(
    {
        "weight": 1,
        "weight_unit": "LB"
    },
    '<parcl_id>'
);
```

<!-- tabs:end -->

- ### Discard a parcel

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Parcels.discard('<parcl_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->parcels->discard('<parcl_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.discard('<parcl_id>');
```

<!-- tabs:end -->


</details>

---

## Customs Info

|        | Endpoints             |
:--------|:--------------------- |
`GET`    | /v1/customs_info      |
`POST`   | /v1/customs_info      |
`GET`    | /v1/customs_info/{id} |
`PATCH`  | /v1/customs_info/{id} |
`DELETE` | /v1/customs_info/{id} |

This is an object representing your Purplship shipping customs info. \
You can create, update and retrieve one or many customs presets stored on your Purplship account.

<details>
<summary>Customs Info API Usage</summary>

- ### Retrieve Customs info presets

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Customs.list()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->addresses->list();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.list();
```

<!-- tabs:end -->

- ### Create a Custom info

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Customs.create({ "terms_of_trade": "DDU" })
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->customs->create([
  "terms_of_trade" => "DDU"
]);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.create({ "terms_of_trade": "DDU" });
```

<!-- tabs:end -->

- ### Retrieve a Customs info

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Customs.retrieve('<cust_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->customs->retrieve('<cust_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.retrieve('<cust_id>');
```

<!-- tabs:end -->

- ### Update a Customs info

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Customs.update(
    { "terms_of_trade": "DDP"},
    '<cust_id>'
)
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->customs->update(
    [ "terms_of_trade" => "DDP" ],
    '<cust_id>',
);
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.update(
    { "terms_of_trade": "DDP"},
    '<cust_id>'
);
```

<!-- tabs:end -->

- ### Discard a Customs info

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Customs.discard('<cust_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->customs->discard('<cust_id>');
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.discard('<cust_id>');
```

<!-- tabs:end -->

</details>

---

## Carriers

|       | Endpoints                       |
:-------|:------------------------------- |
`GET`   | /v1/carriers                    |

You can retrieve one or many carriers configuration stored on your Purplship account.

<details>
<summary>Carriers API Usage</summary>

- ### Retrieve configured carriers

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Carriers.list()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->carriers->list();
```

#### **Typescript**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.carriers.list();
```

<!-- tabs:end -->

</details>

---
