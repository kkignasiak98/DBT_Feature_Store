# Define constants
TERRAGRUNT_VERSION="v0.54.22"
TERRAGRUNT_INSTALL_FILE="terragrunt_linux_amd64"
# Download terragrunt 
wget https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/$TERRAGRUNT_INSTALL_FILE

# Make the download executible
chmod +x $TERRAGRUNT_INSTALL_FILE

# Move the binary to a directory in your PATH
sudo mv $TERRAGRUNT_INSTALL_FILE /usr/local/bin/terragrunt

# Verify the installation
terragrunt --version




