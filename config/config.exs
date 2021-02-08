use Mix.Config

config :logger, :console,
  level: :warn,
  truncate: :infinity

config :ex_aws,
  # debug_requests: true,
  region: {:system, "AWS_REGION"},
  json_codec: Jason

config :ex_aws, :kinesis,
  scheme: "http://",
  host: {:system, "KINESIS_HOST"},
  port: 4567

config :ex_aws, :dynamodb,
  scheme: "http://",
  host: {:system, "DYNAMO_DB_HOST"},
  region: {:system, "AWS_REGION"},
  port: 8000
