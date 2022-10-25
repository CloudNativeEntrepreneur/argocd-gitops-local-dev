# argocd-gitops-local-dev

Gitops config for a local development cluster for developing event-driven architectures.

Includes:
* KNative Serving
  * Kourier for ingress
* Knative Eventing
  * Backed by Kafka
* Postgres Operator
  * Declarative PSQL dbs
  * Backups/restores to/from s3
* Strimzi Kafka Operator
  * Declarative Kafkas

## The `extras` folder

I configured some other tools, but I wanted to keep the dev cluster as lightweight as possible. Left them as examples. Feel free to fork and try them out.


# Private container registry (such as on ghcr.io)?

Using containers on private registry.

Log in to your container registry with:

```
kubectl create secret docker-registry regcred --docker-server=https://ghcr.io --docker-username=<your-github-username> --docker-password=<github_PAT_packages:read> --docker-email=<your-github-email>
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "regcred"}]}'
```