resource "null_resource" "storageclass_gp2_false" {
  depends_on  = [kubernetes_storage_class.sc_af_south_1]

  provisioner "local-exec" {
    command = "kubectl patch storageclass gp2 -p '{\"metadata\": {\"annotations\":{\"storageclass.kubernetes.io/is-default-class\":\"false\"}}}'"
  }
}

resource "null_resource" "storageclass_sc_af_south_1_true" {
  depends_on  = [null_resource.storageclass_gp2_false]

  provisioner "local-exec" {
    command = "kubectl patch storageclass zone-af-south-1 -p '{\"metadata\": {\"annotations\":{\"storageclass.kubernetes.io/is-default-class\":\"true\"}}}'"
  }
}
