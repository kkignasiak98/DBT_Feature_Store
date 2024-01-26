# Define constants
TERRAGRUNT_VERSION="v0.54.22"
# Download terragrunt 
wget https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/terragrunt_linux_amd64

# Make the download executible
chmod +x terragrunt_linux_amd64

# Move the binary to a directory in your PATH
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

# Verify the installation
terragrunt --version




