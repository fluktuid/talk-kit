helm repo add cluster-autoscaler https://kubernetes.github.io/autoscaler
kubectl create ns autoscaler
helm upgrade --install cluster-autoscaler cluster-autoscaler/cluster-autoscaler -n autoscaler --values=autoscaler.yml \
  --set autoDiscovery.clusterName=$(cd ../terraform; terraform output -raw cluster_name)\
  --set awsRegion=$(cd ../terraform; terraform output -raw region)\
  --set rbac.serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=$(cd ../terraform; terraform output -raw autoscaler_iam_role)
