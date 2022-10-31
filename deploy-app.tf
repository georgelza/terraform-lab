# Namespaces
resource "null_resource" "namespace" {
  depends_on  = [kubernetes_storage_class.sc_af_south_1]

  provisioner "local-exec" {
    command = "kubectl apply -f iamza/namespace.yaml"
  }
}

# databases


# App Module #1


# app Module #2