
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class
#
resource "kubernetes_storage_class" "sc_af_south_1" {

  depends_on = [module.eks_blueprints.eks_blueprints_kubernetes_addons]

  metadata {
    name = "zone-af-south-1"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Delete"
  parameters = {
    fstype    = "ext4"
    encrypted = true # EBS volumes will always be encrypted by default

  }
  allow_volume_expansion = true
  volume_binding_mode    = "Immediate"
  allowed_topologies {
    match_label_expressions {
      key    = "failure-domain.beta.kubernetes.io/zone"
      values = ["af-south-1a", "af-south-1b", "af-south-1c"]

    }
  }

}

