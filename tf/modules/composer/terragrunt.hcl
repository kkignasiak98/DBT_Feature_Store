
include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../api", "../storage"]
}

dependency "vpc" {
  config_path = "../vpc"

  # Configure mock outputs for the `validate` and `plan` commands that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate","plan"]
  mock_outputs = {
    network_ID = "fake-vpc-id"
    sub_network_ID = "fake-vpc-subnetwork-id"
  }
}

inputs = {
  network_ID = dependency.vpc.outputs.composer_network_ID
  sub_network_ID = dependency.vpc.outputs.composer_sub_network_ID
}