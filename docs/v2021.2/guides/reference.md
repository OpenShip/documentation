# Reference <!-- {docsify-ignore} -->

The Purplship API is organized around REST. Our API has predictable resource-oriented URLs, accepts form-encoded request bodies, \
returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.

You can use the Purplship API with carriers sandbox servers by setting the `test` flag to `True` when you configure your carrier connection.\
The **carrier id** you specify in the request determines whether the request is live mode or test mode.

The Purplship API differs for every instances as we release new versions and tailor functionality.\
Check your local instance API reference to see docs customized to your version of the API.

---

## Clients

The Purplship team currently actively maintains the following client libraries

- [purplship-php-client](https://github.com/PurplShip/purplship-php-client)
- [purplship-python-client](https://github.com/PurplShip/purplship-python-client)
- [purplship-node](https://github.com/PurplShip/purplship-node)

For any other programming language use our API [OpenAPI specification](https://github.com/PurplShip/purplship-server/tree/main/OpenAPI) to generate a client from the [swagger online editor](https://editor.swagger.io/)

*We actively maintain libraries based on our clients needs so contact us for enterprise need.*

<!-- tabs:start -->

#### **Python**

```shell
pip install purplship-python
```

#### **PHP**

```shell
composer require purplship/purplship-php
```

#### **Node**

```shell
yarn add purplship
```

<!-- tabs:end -->

---

## Authentication

The Purplship API uses API keys to authenticate requests. You can view and manage your API keys in the Purplship Administration panel.

Your API keys carry many privileges, so be sure to keep them secure! Do not share your secret API keys in publicly accessible areas such as GitHub, client-side code, and so forth.

Use your API key by assigning it to client `API_KEY`. The client library will then automatically send this key in each request. \
API requests without authentication will also fail.

<!-- tabs:start -->

#### **Python**

```python
import purplship
purplship.host = 'https://<server_address>/v1'
purplship.api_key = '<api_key>'
```

#### **PHP**

```php
require_once(__DIR__ . '/vendor/autoload.php');

$purplship = new \Purplship\Purplship('<api_key>', 'https://<server_address>/v1');
```

#### **Node**

```javascript
import Purplship from 'purplship';

const purplship = new Purplship('API_KEY', 'https://<server_address>/v1');
```

<!-- tabs:end -->

---

## Errors

Purplship uses conventional HTTP response codes to indicate the success or failure of an API request. \
In general:\
Codes in the 2xx range indicate success. \
Codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted). \
Codes in the 5xx range indicate an error with Purplship's servers.

| HTTP STATUS CODE SUMMARY     |                                                                                                  |
| ---------------------------: |:------------------------------------------------------------------------------------------------ |
|                     200 - OK | Everything worked as expected.                                                                   |
|            400 - Bad Request | The request was unacceptable, often due to missing a required parameter.                         |
|           401 - Unauthorized | No valid API key provided.                                                                       |
|              403 - Forbidden | The API key doesn't have permissions to perform the request.                                     |
|              404 - Not Found | The requested resource doesn't exist.                                                            |
|      429 - Too Many Requests | Too many requests hit the API too quickly. We recommend an exponential backoff of your requests. |
|               409 - Conflict | The API indicates a request conflict with current state of the target resource.                  |
|500, 502, 504 - Server Errors | Something went wrong on Purplship's end. (These are rare.)                                       |
