# Dry run configuration for setup verification
resource "null_resource" "dry_run" {
  provisioner "local-exec" {
    command = <<-EOC
      echo "🔍 Starting dry run for Terraform setup verification..."
      echo "📂 Generating plan file: dryrun.plan"

      # Execute Terraform plan with the selection variables
      terraform plan -var-file=selection.tfvars -out=dryrun.plan
      PLAN_STATUS=$?

      # Evaluate the plan execution result
      if [ $PLAN_STATUS -ne 0 ]; then
        echo "❌ Dry run failed. Please review the errors above and address missing configurations."
        echo "📋 Hint: Ensure all required variables, modules, and credentials are properly set."
        echo "📂 Check the generated 'terraform.tfstate' file for further details."
        exit 1
      else
        echo "✅ Dry run successful! Plan file generated at 'dryrun.plan'."
        echo "➡️  You can now proceed with: 'terraform apply dryrun.plan'"
      fi
    EOC
  }
}