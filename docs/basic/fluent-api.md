# PurplShip Fluent API

```python
# Import PurplShip
import purplship
```

## Gateway

``` python tab="JSON"
carrier_gateway = purplship.gateway['sendle'].create(
    {
        "sendle_id": "user@id",
        "api_key": "l56berylkghekrb527l5bk7575",
    }
)
```

``` python tab="Typed"
from pusplship.mappers.sendle import SendleClient

carrier_gateway = purplship.gateway['sendle'].create(
    SendleClient(
        sendle_id="user@id",
        api_key="l56berylkghekrb527l5bk7575"
    )
)
```

## Rating

!!! Note
    `purplship.rating.fetch(...).from_(carrier_gateway).parse()`

``` python tab="JSON"
import purplship

rates = purplship.rating.fetch(
    {
        "shipper": {
            "city": "string",
            "type": "string",
            "tax_id": "string",
            "person_name": "string",
            "company_name": "string",
            "country_code": "string",
            "phone_number": "string",
            "email_address": "string",
            "state_code": "string",
            "suburb": "string",
            "postal_code": "string",
            "address_lines": [],
            "account_number": "string",
            "extra": {}
        },
        "recipient": {
            "city": "string",
            "type": "string",
            "tax_id": "string",
            "person_name": "string",
            "company_name": "string",
            "country_code": "string",
            "phone_number": "string",
            "email_address": "string",
            "state_code": "string",
            "suburb": "string",
            "postal_code": "string",
            "address_lines": [],
            "account_number": "string",
            "extra": {}
        },
        "shipment": {
            "items": [],
            "insured_amount": 0,
            "total_items": 0,
            "packaging_type": "BOX",
            "is_document": true,
            "currency": "EUR",
            "total_weight": 0,
            "weight_unit": "KG",
            "dimension_unit": "CM",
            "paid_by": "SENDER",
            "payment_country_code": "string",
            "payment_account_number": "string",
            "services": [],
            "options": [],
            "date": "string",
            "payment_type": "string",
            "duty_paid_by": "SENDER",
            "duty_payment_account": "string",
            "declared_value": 0,
            "customs": {},
            "references": [],
            "label": {},
            "invoice": {},
            "doc_images": [],
            "ship_date": "string",
            "extra": {}
        }
    }
)
```

``` python tab="Typed"
from pusplship.domain.Types import (
    Item,
    Party,
    Customs,
    Shipment,
    Label,
    Doc,
    Invoice,
    Option,
    RateRequest
)

rates = purplship.rating.fetch(
    RateRequest(
        shipper=Party(
            city="string",
            type="string",
            tax_id="string",
            person_name="string",
            company_name="string",
            country_name="string",
            country_code="string",
            phone_number="string",
            email_address="string",
            state_code="string",
            suburb="string",
            postal_code="string",
            address_lines=[],
            account_number="string",
            extra={}
        ),
        recipient=Party(
            city="string",
            type="string",
            tax_id="string",
            person_name="string",
            company_name="string",
            country_name="string",
            country_code="string",
            phone_number="string",
            email_address="string",
            state_code="string",
            suburb="string",
            postal_code="string",
            address_lines=[],
            account_number="string",
            extra={}
        ),
        shipment=Shipment(
            items=[
                Item(
                    id="string",
                    weight=0.0,
                    width=0.0,
                    height=0.0,
                    length=10.00,
                    packaging_type="BOX",
                    description="string",
                    content="string",
                    quantity=1,
                    sku="string",
                    code="string",
                    value_amount=0,
                    value_currency="EUR",
                    origin_country="string",
                    extra={}
                )
            ],
            insured_amount=0,
            total_items=0,
            packaging_type="BOX",
            is_document=true,
            currency="EUR",
            total_weight=0,
            weight_unit="KG",
            dimension_unit="CM",
            paid_by="SENDER",
            payment_country_code="string",
            payment_account_number="string",
            services=[],
            options=[
                Option(
                    code="string",
                    value={},
                    extra={}
                )
            ],
            date="string",
            payment_type="string",
            duty_paid_by="SENDER",
            duty_payment_account="string",
            declared_value=0,
            customs=Customs(
                description="string",
                terms_of_trade="string",
                no_eei="string",
                aes="string",
                items=[],
                commercial_invoice=bool,
                extra={}
            ),
            references=[],
            label=Label(
                format="string",
                type="string",
                image="string",
                extra={}
            ),
            invoice=Invoice(
                date="string",
                identifier="string",
                type="string",
                copies=0,
                extra={}
            ),
            doc_images=[
                Doc(
                    format="string",
                    type="string",
                    image="string",
                    extra={}
                )
            ],
            ship_date="string",
            extra={}
        )
    )
)
```

## Tracking

!!! Note
    `purplship.tracking.fetch(...).from_(carrier_gateway).parse()`

## Shipping

!!! Note
    `purplship.shipping.create(...).with_(carrier_gateway).parse()`

## Pickup

- Book

!!! Note
    `purplship.pickup.book(...).with_(carrier_gateway).parse()`

- Update

!!! Note
    `purplship.pickup.update(...).from_(carrier_gateway).parse()`

- Cancel

!!! Note
    `purplship.pickup.cancel(...).from_(carrier_gateway).parse()`
