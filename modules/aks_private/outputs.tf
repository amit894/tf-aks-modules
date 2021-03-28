output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
output "oms_principal_id" {
  value = azurerm_kubernetes_cluster.aks.addon_profile[0].oms_agent[0].oms_agent_identity[0].object_id
}
output "principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
output "kubelet_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
