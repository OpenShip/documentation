# PurplShip Fluent API

The fluent API is a higher level interface that offers a minimal [Domain Specific Language](https://martinfowler.com/bliki/FluentInterface.html) for shipping services integration expressed as code.

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
from purplship.gateway import Providers
from pusplship.mappers.sendle import SendleClient

carrier_gateway = purplship.gateway[Providers.sendle].create(
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

```python tab="JSON"
purplship.tracking.fetch(
    {
        "tracking_numbers": ["string"],
        "language_code": "string",
        "extra": {}
    }
)
```

```python tab="Typed"
from purplship.domain.Types import TrackingRequest

purplship.tracking.fetch(
    TrackingRequest(
        tracking_numbers=["string"],
        language_code="string",
        extra= {}
    )
)
```

## Shipping

!!! Note
    `purplship.shipping.create(...).with_(carrier_gateway).parse()`

``` python tab="JSON"

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
    ShipmentRequest
)

rates = purplship.rating.fetch(
    ShipmentRequest(
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

## Pickup

- Book

!!! Note
    `purplship.pickup.book(...).with_(carrier_gateway).parse()`

```python tab="JSON"

purplship.pickup.book(
    {
        "date": "string",
        "account_number": "string",
        "weight": 0,
        "weight_unit": "KG",
        "pieces": 0,
        "ready_time": "string",
        "closing_time": "string",
        "instruction": "string",
        "package_location": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string",
        "state_code": "string",
        "country_name": "string",
        "country_code": "string",
        "person_name": "string",
        "company_name": "string",
        "phone_number": "string",
        "email_address": "string",
        "is_business": true,
        "address_lines": [],
        "extra": {}
    }
)
```

```python tab="Typed"

from purplship.domain.Types import PickupRequest

purplship.pickup.book(
    PickupRequest(
        date="string",
        account_number="string",
        pieces=0,
        weight=0,
        weight_unit="LB",
        ready_time="string",
        closing_time="string",
        city="string",
        postal_code="string",
        person_name="string",
        phone_number="string",
        region_code="string",
        country_code="string",
        email_address="string",
        instruction="string",
        address_lines=["string"],
        extra={}
    )
)
```

- Update

!!! Note
    `purplship.pickup.update(...).from_(carrier_gateway).parse()`

```python tab="JSON"

purplship.pickup.update(
    {
        "date": "string",
        "account_number": "string",
        "weight": 0,
        "weight_unit": "KG",
        "pieces": 0,
        "ready_time": "string",
        "closing_time": "string",
        "instruction": "string",
        "package_location": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string",
        "state_code": "string",
        "country_name": "string",
        "country_code": "string",
        "person_name": "string",
        "company_name": "string",
        "phone_number": "string",
        "email_address": "string",
        "is_business": true,
        "confirmation_number": "string",
        "address_lines": [],
        "extra": {}
    }
)
```

```python tab="Typed"

from purplship.domain.Types import PickupUpdateRequest

purplship.pickup.update(
    PickupUpdateRequest(
        date="string",
        account_number="string",
        pieces=0,
        weight=0,
        weight_unit="LB",
        ready_time="string",
        closing_time="string",
        city="string",
        postal_code="string",
        person_name="string",
        phone_number="string",
        region_code="string",
        country_code="string",
        email_address="string",
        instruction="string",
        address_lines=["string"],
        confirmation_number="string",
        extra={}
    )
)
```

- Cancel

!!! Note
    `purplship.pickup.cancel(...).from_(carrier_gateway).parse()`

```python tab="JSON"

purplship.pickup.update(
    {
        "pickup_date": "string"
        "confirmation_number": "string"
        "person_name": "string"
        "country_code": "string"
        "extra": {}
    }
)
```

```python tab="Typed"

from purplship.domain.Types import PickupCancellationRequest

purplship.pickup.update(
    PickupCancellationRequest(
        pickup_date="string"
        confirmation_number="string"
        person_name="string"
        country_code="string"
        extra={}
    )
)
```
