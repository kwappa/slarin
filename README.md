# Slarin

A slack bot to help managing guest accounts.

## Installation

### Set `.env` on root directory

```
# ruboty setting
DISABLE_DEFAULT_HANDLERS    = '1'
LOG_LEVEL                   = 'debug'
RUBOTY_ENV                  = 'production'
RUBOTY_NAME                 = 'slarin'

SLACK_TOKEN                 = 'XXXX-000000000000-************************'
SLACK_IGNORE_GENERAL        = 1
SLACK_GENERAL_NAME          = 'general'

SLARIN_GUEST_ROOMS          = 'G99999999,G88888888'
```

`SLARIN_GUEST_ROOMS` : Channel IDs to allow working slarin.

### Customize `bin/slarin` to fit your environment

Refere from [this article](http://yono.hatenablog.jp/entry/20130304/1362366235)

### Start your slarin

`$ bin/slarin start`

## License

The program is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
