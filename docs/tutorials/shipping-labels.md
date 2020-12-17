# Shipping Labels

Buying a label for your shipment can be done using the Purplship API in two steps

**1 - Get shipping rates** [>](/tutorials/shipping-labels?id=_1-get-shipping-rates) \
**2 - Buy a label** [>](/tutorials/shipping-labels?id=_2-buy-a-label)

## 1 - Get shipping rates

The first set is to retrieve the shipping rates and associated services available for your shipment based
on the **package** (`Parcel`) weight and dimensions, the origin **address** (`Shipper`) and the destination **address** (`Recipient`).\
Both addresses require a `person_name`, `address_line1`, `city`, `state_code`, `country_code` and a `postal_code` values.

<!-- tabs:start -->

### **cURL**

```shell
curl --request POST \
  --url https://<server_address>/v1/shipments \
  --header 'Authorization: Token <API_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
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
}'
```

### **Javascript - Ajax**

```javascript
const data = JSON.stringify({
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

const settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://<server_address>/v1/shipments",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Token <API_KEY>"
  },
  "processData": false,
  "data": data
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

recipient = {
    "address_line1": "125 Church St",
    "person_name": "John Doe",
    "company_name": "A corp.",
    "phone_number": "514-000-0000",
    "city": "Moncton",
    "country_code": "CA",
    "postal_code": "E1C4Z8",
    "residential": False,
    "state_code": "NB"
}

shipper = {
    "address_line1": "5840 Oak St",
    "person_name": "Jane Doe",
    "company_name": "B corp.",
    "phone_number": "514-000-0000",
    "city": "Vancouver",
    "country_code": "CA",
    "postal_code": "V6M2V9",
    "residential": True,
    "state_code": "BC"
}

parcel = {
    "weight": 0.2,
    "width": 10,
    "height": 10,
    "length": 1,
    "packaging_type": "pak",
    "is_document": False,
    "weight_unit": "KG",
    "dimension_unit": "CM"
}

purplship.Shipments.create({
  "recipient": recipient,
  "shipper": shipper,
  "parcels": [ parcel ]
})
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$recipient = array(
    "address_line1" => "125 Church St",
    "person_name" => "John Doe",
    "company_name" => "A corp.",
    "phone_number" => "514-000-0000",
    "city" => "Moncton",
    "country_code" => "CA",
    "postal_code" => "E1C4Z8",
    "residential" => False,
    "state_code" => "NB"
);

$shipper = array(
    "address_line1" => "5840 Oak St",
    "person_name" => "Jane Doe",
    "company_name" => "B corp.",
    "phone_number" => "514-000-0000",
    "city" => "Vancouver",
    "country_code" => "CA",
    "postal_code" => "V6M2V9",
    "residential" => False,
    "state_code" => "BC"
);

$parcel = [
    "weight" => 0.2,
    "width" => 10,
    "height" => 10,
    "length" => 1,
    "packaging_type" => "pak",
    "is_document" => False,
    "weight_unit" => "KG",
    "dimension_unit" => "CM"
];

$purplship->shipments->create([
  "recipient" => $recipient,
  "shipper" => $shipper,
  "parcels" => array( $parcel )
]);
```

<!-- tabs:end -->

> The shipment object can receive additional properties
> - `options` (for signature confirmation, COD, ...)
> - `customs` (for international shipment custom info)
> - `services` (the list of carrier expected services)
> - `carrrier_ids` (to receive rates from a specific carrier accounts)

The API will respond with a Shipment object serialized in JSON:

```json
{
  "id": "shp_85e4e3c05fd5478db18b3f342a6aa34d",
  "status": "created",
  "carrier_name": null,
  "carrier_id": null,
  "label": null,
  "tracking_number": null,
  "shipment_identifier": null,
  "selected_rate": null,
  "selected_rate_id": null,
  "rates": [
    {
      "id": "rat_d4a050db42ef4135875c665884706836",
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
      "carrier_ref": "car_81f6f63a8d8e4001b31c36804fd35704",
      "test_mode": true
    },
    {
      "id": "rat_f6dd81b128584038a7320d684d53916e",
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
      "carrier_ref": "car_81f6f63a8d8e4001b31c36804fd35704",
      "test_mode": true
    },
    {
      "id": "rat_dbd8e0e7171a491fb508c741dcf6e47a",
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
      "carrier_ref": "car_81f6f63a8d8e4001b31c36804fd35704",
      "test_mode": true
    },
    {
      "id": "rat_c9e7e423cd284aab9fc3bef95cca74df",
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
      "carrier_ref": "car_81f6f63a8d8e4001b31c36804fd35704",
      "test_mode": true
    }
  ],
  "tracking_url": null,
  "service": null,
  "shipper": {
    "id": "adr_d29bb46763754407a9e43d4ccd00a696",
    "postal_code": "V6M2V9",
    "city": "Vancouver",
    "federal_tax_id": null,
    "state_tax_id": null,
    "person_name": "Jane Doe",
    "company_name": "B corp.",
    "country_code": "CA",
    "email": null,
    "phone_number": "514 000 9999",
    "state_code": "BC",
    "suburb": null,
    "residential": false,
    "address_line1": "5840 Oak St",
    "address_line2": null
  },
  "recipient": {
    "id": "adr_bcd4d618eb8e421b98fc52eb813e9eab",
    "postal_code": "E1C4Z8",
    "city": "Moncton",
    "federal_tax_id": null,
    "state_tax_id": null,
    "person_name": "John Poop",
    "company_name": "A corp.",
    "country_code": "CA",
    "email": null,
    "phone_number": "514 000 0000",
    "state_code": "NB",
    "suburb": null,
    "residential": false,
    "address_line1": "125 Church St",
    "address_line2": null
  },
  "parcels": [
    {
      "id": "pcl_adc08e6063614bd1be9053cdc97052f8",
      "weight": 1.1,
      "width": null,
      "height": null,
      "length": null,
      "packaging_type": null,
      "package_preset": "canadapost_corrugated_small_box",
      "description": null,
      "content": null,
      "is_document": false,
      "weight_unit": "KG",
      "dimension_unit": null
    }
  ],
  "services": [],
  "options": {},
  "payment": {
    "id": "pyt_2808068ee625424d9f8969e223334cad",
    "paid_by": "sender",
    "amount": null,
    "currency": "CAD",
    "account_number": null,
    "credit_card": null,
    "contact": null
  },
  "customs": null,
  "doc_images": [],
  "reference": null,
  "carrier_ids": [
    "canadapost"
  ],
  "meta": {},
  "created_at": "2020-12-08 22:52:28.464378+00:00",
  "test_mode": true
}
```

The response contains a list of rates for the Shipment.

---

## 2 - Buy a label

Once you've created a shipment object and received rates. You can use the Shipment API to purchase a label for your preferred rate (`service`).

<!-- tabs:start -->

### **cURL**

```shell
curl --request POST \
  --url https://<server_address>/v1/shipments/<shipment_id>/purchase \
  --header 'Authorization: Token <API_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
  "selected_rate_id": "<rat_id>",
  "payment": {
      "paid_by": "sender"
  }
}'
```

### **Javascript - Ajax**

```javascript
const data = JSON.stringify({
  "selected_rate_id": "<selected_rate_id>",
  "payment": {
      "paid_by": "sender"
  }
});

const settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://<server_address>/v1/shipments/<shipment_id>/purchase",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Token <API_KEY>"
  },
  "processData": false,
  "data": data
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Shipments.purchase({
  "selected_rate_id": "<selected_rate_id>",
  "payment": {
      "paid_by": "sender"
  }
}, '<shipment_id>')
```

### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->shipments->purchase(
  [
    "selected_rate_id" => "<selected_rate_id>",
    "payment" => [
        "paid_by" => "sender"
    ]
  ],
  '<shipment_id>'
);
```

<!-- tabs:end -->

When successful, the API will respond with a Shipment object serialized in JSON:

```json
{
  "messages": [],
  "shipment": {
    "id": "shp_e53f4d88846a48079e71c2fff81dfddc",
    "status": "purchased",
    "carrier_name": "canadapost",
    "carrier_id": "canadapost",
    "label": "JVBERi0xLjQKJfbk (Truncated base64) ==",
    "tracking_number": "123456789012",
    "shipment_identifier": "123456789012",
    "selected_rate": {
      "id": "rat_314a24e3a2b3444a9c4f688daced0cb8",
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
      "carrier_ref": "car_894d6fd2ccd943108dc0b48129bbe19c",
      "test_mode": true
    },
    "selected_rate_id": "rat_314a24e3a2b3444a9c4f688daced0cb8",
    "rates": [
      {
        "id": "rat_314a24e3a2b3444a9c4f688daced0cb8",
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
        "carrier_ref": "car_894d6fd2ccd943108dc0b48129bbe19c",
        "test_mode": true
      },
      {
        "id": "rat_061c3c072dab4c2a920c0907cef985df",
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
        "carrier_ref": "car_894d6fd2ccd943108dc0b48129bbe19c",
        "test_mode": true
      },
      {
        "id": "rat_8b2280f5e1b444f2b03e37636fc1fb92",
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
        "carrier_ref": "car_894d6fd2ccd943108dc0b48129bbe19c",
        "test_mode": true
      },
      {
        "id": "rat_baa89f211ab84d4992a5aefab3cdb1a9",
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
        "carrier_ref": "car_894d6fd2ccd943108dc0b48129bbe19c",
        "test_mode": true
      }
    ],
    "tracking_url": "/v1/tracking_status/canadapost/123456789012?test",
    "service": "canadapost_regular_parcel",
    "shipper": {
      "id": "adr_5713af1104b542cf84e7f64cda719d70",
      "postal_code": "V6M2V9",
      "city": "Vancouver",
      "federal_tax_id": null,
      "state_tax_id": null,
      "person_name": "Jane Doe",
      "company_name": "B corp.",
      "country_code": "CA",
      "email": null,
      "phone_number": "514 000 9999",
      "state_code": "BC",
      "suburb": null,
      "residential": false,
      "address_line1": "5840 Oak St",
      "address_line2": null
    },
    "recipient": {
      "id": "adr_04b190f443d4407b9c83c028dc3e4510",
      "postal_code": "E1C4Z8",
      "city": "Moncton",
      "federal_tax_id": null,
      "state_tax_id": null,
      "person_name": "John Poop",
      "company_name": "A corp.",
      "country_code": "CA",
      "email": null,
      "phone_number": "514 000 0000",
      "state_code": "NB",
      "suburb": null,
      "residential": false,
      "address_line1": "125 Church St",
      "address_line2": null
    },
    "parcels": [
      {
        "id": "pcl_0b9fd94d2ec74238828a572d69f4c95a",
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
      "id": "pyt_31cd4da234f44718b1658ac1c5157a29",
      "paid_by": "sender",
      "amount": null,
      "currency": "CAD",
      "account_number": null,
      "credit_card": null,
      "contact": null
    },
    "customs": null,
    "doc_images": [],
    "reference": null,
    "carrier_ids": [],
    "meta": {},
    "created_at": "2020-10-24 07:47:23.871903+00:00",
    "test_mode": true
  }
}
```

> The returned shipment object has
> - a `status` of `purchased`
> - a `label` is returned as a `base64` string
> - a `tracking_number`
