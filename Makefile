# updates in git
download-argocd-image-updater:
	mkdir -p ./apps/argocd-image-updater/base
	mkdir -p ./apps/argocd-image-updater/overlays
	curl -L https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml \
		> apps/argocd-image-updater/base/install.yaml


download-knative-operator:
	curl -L https://github.com/knative/operator/releases/download/knative-v1.6.0/operator.yaml \
		| sed 's/namespace: default/namespace: knative-operator/' \
		> apps/knative-operator/base/operator.yaml

download-knative-serving:
	curl -L https://github.com/knative/serving/releases/download/knative-v1.6.0/serving-default-domain.yaml > apps/knative-serving/base/serving-default-domain.yaml

download-knative-eventing:
	curl -L https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.6.0/eventing-kafka-controller.yaml > apps/knative-eventing/base/eventing-kafka-controller.yaml
	curl -L https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.6.0/eventing-kafka-broker.yaml > apps/knative-eventing/base/eventing-kafka-broker.yaml

download-olm:
	mkdir -p apps/olm/base/charts/olm
	mkdir -p .tmp && cd .tmp && curl -L https://github.com/operator-framework/operator-lifecycle-manager/archive/v0.21.2.tar.gz | tar zx
	mv .tmp/operator-lifecycle-manager-0.21.2/deploy/chart/* apps/olm/base/charts/olm
	rm -rf .tmp/operator-lifecycle-manager-0.21.2

download-schemahero:
	kubectl schemahero install --yaml > ./apps/schemahero/base/schemahero.yaml

onboard:
	kubectl ctx rancher-desktop
	@echo "Before this command will work, you must generate and set the environment variable 'GH_TOKEN'. Click the following link to generate a new token: https://github.com/settings/tokens/new?scopes=repo"
	GIT_REPO=https://github.com/stealth-aurelius/local-dev-cluster argocd-autopilot repo bootstrap --recover
	@echo "✅ Configured"