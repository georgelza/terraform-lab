# Namespaces
data "template_file" "namespace" {
  template = "${file("${path.module}/iamza/namespace.yaml")}"
}

resource "null_resource" "namespace" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.namespace.rendered}")}"
  }

  depends_on  = [kubernetes_storage_class.sc_af_south_1]


  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.namespace.rendered}\nEOF"
  }
}

# databases


# App Module #1


# app Module #2