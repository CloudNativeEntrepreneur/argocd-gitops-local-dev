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