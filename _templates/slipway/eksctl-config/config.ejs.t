---
to: eks/config/<%=clusterName%>.yaml
force: true
---
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: <%=clusterName%>
  region: <%=region%>
  version: "<%=kubernetesVersion%>"

autoModeConfig:
  enabled: true

gitops:
  flux:
    gitProvider: github
    flags:
      owner: <%=githubOwner%>
      repository: <%=repoName%>
      branch: main
      path: flux/clusters/<%=clusterName%>