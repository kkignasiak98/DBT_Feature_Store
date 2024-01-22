#Based on the google cloud documentation
# https://cloud.google.com/sdk/docs/install#linux
      
# Start
gcloud init

# Download the Linux archive file, run the following command
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-460.0.0-linux-x86_64.tar.gz

 #To extract the contents of the file to your file system (preferably to your home directory), run the following command:
 tar -xf google-cloud-cli-460.0.0-linux-x86_64.tar.gz

 # Add to the path
 ./google-cloud-sdk/install.sh


 # Initialize
 ./google-cloud-sdk/bin/gcloud init
