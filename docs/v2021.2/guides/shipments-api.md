# Shipments API <!-- {docsify-ignore} -->

## Shipments

|         | Endpoints                      |
:---------|:------------------------------ |
|`GET`    | /v1/shipments                  |
|`POST`   | /v1/shipments                  |
|`GET`    | /v1/shipments/{id}             |
|`DELETE` | /v1/shipments/{id}             |
|`POST`   | /v1/shipments/{id}/customs     |
|`POST`   | /v1/shipments/{id}/options     |
|`POST`   | /v1/shipments/{id}/parcels     |
|`POST`   | /v1/shipments/{id}/purchase    |
|`GET`    | /v1/shipments/{id}/rates       |

- ### Retrieve shipments

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.list();
```

<!-- tabs:end -->

</details>

- ### Create a shipment

<details>
<summary>Usage</summary>

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

#### **Node**

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

</details>

- ### Retrieve a shipment

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.retrieve('<shp_id>');
```

<!-- tabs:end -->

</details>

- ### Cancel a shipment

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.cancel('<shp_id>');
```

<!-- tabs:end -->

</details>

- ### Add a shipment customs declaration

<details>
<summary>Usage</summary>

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'
customs = {
  "incoterm": "FCA",
  "content_type": "documents"
}

purplship.Shipments.add_customs(customs, '<shp_id>')
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

#### **Node**

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

- ### Add a shipment parcel

<details>
<summary>Usage</summary>

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'
parcel = {
  "weight": 1,
  "width": 20,
  "height": 10,
  "length": 29,
  "weight_unit": "KG",
  "dimension_unit": "CM"
}

purplship.Shipments.add_parcel(parcel, '<shp_id>')
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
$parcel = [
    "weight" => 1,
    "width" => 20,
    "height" => 10,
    "length" => 29,
    "weight_unit" => "KG",
    "dimension_unit" => "CM"
];

$purplship->shipments->addParcel($parcel, '<shp_id>');
```

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
const parcel = {
  "weight": 1,
  "width": 20,
  "height": 10,
  "length": 29,
  "weight_unit": "KG",
  "dimension_unit": "CM"
};

purplship.shipments.addParcel(parcel, '<shp_id>');
```

<!-- tabs:end -->

</details>

- ### Add shipment options

This service allow the submission and modification of the options provided for the shipment.
Shipment options are various check your instance API reference for a full list of options available for each carrier.

> e.g.

```json
{
  "insurance": 54,
  "currency": "CAD"
}
```

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.setOptions({
    "insurance": 54,
    "currency": "CAD"
}, '<shp_id>');
```

<!-- tabs:end -->

</details>

- ### Buy a shipment label

<details>
<summary>Usage</summary>

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

#### **Node**

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

</details>

- ### Refresh a shipment rates

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.shipments.rates('<shp_id>');
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

- ### Retrieve addresses

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.list();
```

<!-- tabs:end -->

</details>

- ### Create an address

<details>
<summary>Usage</summary>

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

#### **Node**

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

</details>

- ### Retrieve an address

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.retrieve('<addr_id>');
```

<!-- tabs:end -->

</details>

- ### Update an address

<details>
<summary>Usage</summary>

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

#### **Node**

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

- ### Retrieve parcels

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.list();
```

<!-- tabs:end -->

</details>

- ### Create a parcel

<details>
<summary>Usage</summary>

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

#### **Node**

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

</details>

- ### Retrieve a parcel

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.parcels.retrieve('<parcl_id>');
```

<!-- tabs:end -->

</details>

- ### Update a parcel

<details>
<summary>Usage</summary>

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

#### **Node**

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

</details>

- ### Discard a parcel

<details>
<summary>Usage</summary>

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

#### **Node**

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

- ### Retrieve Customs info presets

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.addresses.list();
```

<!-- tabs:end -->

</details>

- ### Create a Custom info

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.create({ "terms_of_trade": "DDU" });
```

<!-- tabs:end -->

</details>

- ### Retrieve a Customs info

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.retrieve('<cust_id>');
```

<!-- tabs:end -->

</details>

- ### Update a Customs info

<details>
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.customs.update(
    { "terms_of_trade": "DDP"},
    '<cust_id>'
);
```

<!-- tabs:end -->

</details>

- ### Discard a Customs info

<details>
<summary>Usage</summary>

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

#### **Node**

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
<summary>Usage</summary>

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

#### **Node**

```javascript
import Purplship from 'purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.carriers.list();
```

<!-- tabs:end -->

</details>
