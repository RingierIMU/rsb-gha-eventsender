# rsb-gha-eventsender
A GitHub Action that sends events to the Ringier Event Bus

## Inputs

### `venture-config-id`

**Required** Your Venture ID

### `username`

**Required** Your username for the bus

### `password`

**Required** Your password for the bus

### `bus-base-url`

**Required** The base URL of the bus

### `eventname`

**Required** The name of the event, that you want to send to the bus

### `payload`

**Required** The JSON payload, that you want to send within the event

## Outputs

### `event`

The event that was sent to the bus.

## Example usage

- name: Send an event to the Ringier Event Bus
  uses: ./
  id: sendevent
  with:
    venture-config-id: ${{ secrets.RSB_VENTURE_CONFIG_ID }}
    username: ${{ secrets.RSB_USERNAME }}
    password: ${{ secrets.RSB_PASSWORD }}
    bus-base-url: ${{ secrets.RSB_BUS_BASE_URL }}
    payload: '{"firstname": "Sam", "surname": "Smith"}'

The payload is static here but you want use the output from another step e.g.
