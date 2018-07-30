# Psf

  * Install dependencies with `mix deps.get`
  * Save client-key.pem and gcloud-config-test.secret.json to ./priv/cert (the former file doesn't seem to be needed, just remove `certfile` and `keyfile` from [channel ssl configuration](https://github.com/clearjs/pubsub-grpc-auth-elixir/blob/master/priv/client.exs), and the latter can be generated for you project at https://console.developers.google.com/apis/credentials)
  * `export GOOGLE_APPLICATION_CREDENTIALS="/PATH/TO/YOUR/gcloud-config-test.secret.json"` (optional if you saved it as described above)
  * `mix run ./priv/client.exs`
