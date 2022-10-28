# argocd-gitops-local-dev

Gitops config for a local development cluster for developing event-driven architectures.

To get started, first log in to GHCR, then apply the gitops config using argocd autopilot.

# Private container registry (such as on ghcr.io)?

Using containers on private registry.

Log in to your container registry with:

```
kubectl create secret docker-registry ghcr --docker-server=https://ghcr.io --docker-username=<your-github-username> --docker-password=<github_PAT_packages:read> --docker-email=<your-github-email>
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "ghcr"}]}'
```

# Apply this config with argocd autopilot

```
export GIT_REPO=https://github.com/CloudNativeEntrepreneur/example-gitops
export GIT_TOKEN=<paste in your github PAT created here: https://github.com/settings/tokens/new?scopes=repo>

argocd-autopilot repo bootstrap --recover
```