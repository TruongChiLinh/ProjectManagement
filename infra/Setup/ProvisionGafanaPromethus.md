# add prometheus Helm repo

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

# add grafana Helm repo

`helm repo add grafana https://grafana.github.io/helm-charts`

```sh {"id":"01J87W24JHB4G2J2K78S6TQ10K"}
kubectl create namespace prometheus

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install prometheus prometheus-community/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2" \
    --set server.persistentVolume.storageClass="gp2"

```

kubectl get all -n prometheus

# add the ingress promethues TBD

kubectl create namespace grafana

helm install grafana grafana/grafana \
--namespace grafana \
--set persistence.storageClassName="gp2" \
--set persistence.enabled=true \
--set adminPassword='EKS!sAWSome' \
--values grafana.yaml \
--set service.type=LoadBalancer

kubectl get all -n grafana

export ELB=$(kubectl get svc -n grafana grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

echo "http://$ELB"

kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo