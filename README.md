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
