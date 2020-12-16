## Utils

|       | Endpoints      |
:-------|:-------------- |
`GET`   | /v1/references |
`POST`  | /v1/label      |

The Purplship Utils API is dedicated to offer useful helpers and references that could come up handy when developing an application consuming the API.

- ### Get API data references

This services will return all the static data you might need to display and prevalidate request payload.

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Utils.references()
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->utils->references();
```

#### **Typescript**

```javascript
import Purplship from '@purplship/purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.utils.references();
```

<!-- tabs:end -->

- ### Print base64 shipping label

This service is a minimal helper that returns a PDF file from a shipment `base64 label`.

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'

purplship.Utils.print_label({
    "name": "expected-filename",
    "label": "JVBERi0xLjQKJfbk (Truncated base64) =="
})
```

#### **PHP**

```php
$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');

$purplship->utils->printLabel([
    "name" => "expected-filename",
    "label" => "JVBERi0xLjQKJfbk (Truncated base64) =="
]);
```

#### **Typescript**

```javascript
import Purplship from '@purplship/purplship';
const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');

purplship.tracking.prinLabel({
    "name": "expected-filename",
    "label": "JVBERi0xLjQKJfbk (Truncated base64) =="
});
```

<!-- tabs:end -->
