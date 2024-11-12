# Dry run configuration for setup verification
resource "null_resource" "dry_run" {
  provisioner "local-exec" {
    command = <<-EOC
      echo "Starting dry run..."
      terraform plan -out=dryrun.plan
      if [ $? -ne 0 ]; then
        echo "Dry run failed. Please review errors above and address missing configurations."
        exit 1
      else
        echo "Dry run successful. Proceeding with installation."
      fi
    EOC
  }
}