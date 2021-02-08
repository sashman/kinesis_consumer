# KinesisConsumer

Standard out elixir kinesis consumer.

## Usage

When started give the task some time to resolve the lease:

```
STREAM_NAME=diseases mix start
```

## Params

- `APP_NAME` - Application name to register as a lease against.
- `AWS_REGION`
- `KINESIS_HOST`
- `DYNAMO_DB_HOST`
