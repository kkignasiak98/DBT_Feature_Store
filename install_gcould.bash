#Based on the google cloud documentation
# https://cloud.google.com/sdk/docs/install#linux
      
# Start
gcloud init

# Download the Linux archive file, run the following command
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-460.0.0-linux-x86_64.tar.gz

 #To extract the contents of the file to your file system (preferably to your home directory), run the following command:
 tar -xf google-cloud-cli-460.0.0-linux-x86_64.tar.gz

 # run the script
 ./google-cloud-sdk/install.sh

# Add to the path

GCLOUD_PATH="./google-cloud-sdk//bin"  # 

# Add gcloud to PATH in the user's Bash profile
echo 'export PATH=$PATH:'"$GCLOUD_PATH" >> ~/.bashrc

# Apply the changes for the current session
source ~/.bashrc

echo "Google Cloud SDK added to the PATH. You can now use 'gcloud' command."


 # Initialize
 gcloud init
