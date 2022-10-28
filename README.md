# example-gitops

Gitops config for a local cluster showing full CI/CD pipelines using Github Actions and ArgoCD. The deployed "example domain" shows off a few examples:

1. An example Sveltekit application with web3auth and a todo applications
2. A full CQRS/ES backend for a ToDo applications with Hasura and microservices
3. A web3auth server

To get started, first log in to GHCR, then apply the gitops config using argocd autopilot.

# Private container registry (such as on ghcr.io)?

Using containers on private registry.

Log in to your container registry with:

```
kubectl create ns example-prod-env
kubectl -n example-prod-env create secret docker-registry ghcr --docker-server=https://ghcr.io --docker-username=<your-github-username> --docker-password=<github_PAT_packages:read> --docker-email=<your-github-email>
kubectl -n example-prod-env patch serviceaccount default -p '{"imagePullSecrets": [{"name": "ghcr"}]}'
```

# Apply this config with argocd autopilot

```
export GIT_REPO=https://github.com/CloudNativeEntrepreneur/example-gitops
export GIT_TOKEN=<paste in your github PAT created here: https://github.com/settings/tokens/new?scopes=repo>

argocd-autopilot repo bootstrap --recover
```