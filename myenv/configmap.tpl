apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${eks_dashapp_role_arn}
      username: eks_dashapp_role
      groups:
        - system:masters
    