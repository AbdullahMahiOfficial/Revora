# Revora — High Availability PostgreSQL on Azure Kubernetes Service (AKS)

Automated cloud infrastructure and High Availability PostgreSQL deployment using **Terraform**, **Azure CLI**, **Helm**, **kubectl**, and **CloudNativePG**.

## Architecture Highlights
- **Infrastructure as Code (Terraform):** Provisions Resource Group, Virtual Network, Subnet, and AKS Cluster (`Standard_B2s` nodes).
- **High Availability PostgreSQL:** 3-instance cluster (`1` Primary + `2` Replicas) managed by CloudNativePG with automatic failover and `managed-csi` persistent storage.
- **Monitoring:** `kube-prometheus-stack` (Prometheus & Grafana) with a custom `PodMonitor` for PostgreSQL metrics.