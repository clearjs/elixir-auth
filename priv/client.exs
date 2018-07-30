auth = Psf.authenticate() |> IO.inspect
ca_path = Path.expand("./cert/roots.pem", :code.priv_dir(:psf))
cert_path = Path.expand("./cert/client-cert.pem", :code.priv_dir(:psf))
key_path = Path.expand("./cert/client-key.pem", :code.priv_dir(:psf))
cred = GRPC.Credential.new(ssl: [
  certfile: cert_path,
  keyfile: key_path,
  cacertfile: ca_path,
  #server_name_indication: "pubsub.googleapis.com",
  verify: :verify_peer
])
opts = [cred: cred]
url = System.get_env("PUBSUB_ENDPOINT") || "pubsub.googleapis.com:443"
{:ok, channel} = GRPC.Stub.connect(url, opts) |> IO.inspect
{:ok, project_id} = Goth.Config.get(:project_id)
req = Google.Pubsub.V1.ListTopicsRequest.new(project: "projects/#{project_id}", page_size: 5) |> IO.inspect
{_, _reply} = channel |> Google.Pubsub.V1.Publisher.Stub.list_topics(req, token: auth.token) |> IO.inspect
