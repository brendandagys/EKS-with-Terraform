# # Kubernetes Service Manifest (Type: Load Balancer)
# resource "kubernetes_service_v1" "lb_service_clb" {
#   metadata {
#     name = "myapp1-load-balance-service-clb"
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment_v1.myapp1.spec.0.selector.0.match_labels.app
#     }
#     port {
#       name = "http"
#       port = 80
#       target_port = 80
#     }
#     type = "LoadBalancer"
#   }
# }
