Install openebs:

helm repo add openebs https://openebs.github.io/openebs

helm repo update

helm install openebs --namespace openebs openebs/openebs --set engines.replicated.mayastor.enabled=false --create-namespace