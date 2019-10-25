# Getting started
Generate a simple Certificate Authority for local development or testing.

```
$ docker run --rm -v $pwd/:/certs katoni/generate-ca
```

## Advanced Usage
Customize the certificate using the following environment variables:

| Environment variable  | Description          | Default                |
|:----------------------|:---------------------|:-----------------------|
| CA_KEY                | CA key file          | ca-key.pem             |
| CA_CERT               | CA certificate file  | ca.pem                 |
| CA_SUBJECT            | CA subject           | Fake Authority         |
| CA_EXPIRE             | CA expiration date   | 1800 days (~5 years)   |
| CA_SIZE               | CA size              | 2048 bits              |

Example:
```
$ docker run --rm -v $pwd/:/certs -e CA_KEY=ca.key -e CA_CERT=ca.crt katoni/generate-ca
```
