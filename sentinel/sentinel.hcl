sentinel {
  features = {
    apply-all = true
    terraform = true // Add the following imports to the standard library: tfplan, tfconfig, tfstate
  }
}

import "plugin" "tfplan/v2" {
  config = {
    "plan_path": "../terraform/tfplan.json"
  }
}

policy "storage-restrictions" {
  source = "./storage-restrictions.sentinel"
  enforcement_level = "advisory"
}

policy "location-restrictions" {
  source = "./resource-location-restrictions.sentinel"
  enforcement_level = "advisory"
}