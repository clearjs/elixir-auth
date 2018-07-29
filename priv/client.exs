auth = Psf.authenticate() |> IO.inspect
opts = [cred: GRPC.Credential.new(ssl: [])]
url = System.get_env("PUBSUB_ENDPOINT") || "pubsub.googleapis.com:443"
{:ok, channel} = GRPC.Stub.connect(url, opts) |> IO.inspect
{:ok, project_id} = Goth.Config.get(:project_id)
req = Google.Pubsub.V1.ListTopicsRequest.new(project: "projects/#{project_id}", page_size: 5) |> IO.inspect
{_, _reply} = channel |> Google.Pubsub.V1.Publisher.Stub.list_topics(req, token: auth.token) |> IO.inspect
