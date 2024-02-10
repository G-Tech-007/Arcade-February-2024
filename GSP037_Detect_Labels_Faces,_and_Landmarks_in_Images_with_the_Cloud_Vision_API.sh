gcloud alpha services api-keys create --display-name="G-TECH" 
KEY_NAME=$(gcloud alpha services api-keys list --format="value(name)" --filter "displayName=G-TECH")
export API_KEY=$(gcloud alpha services api-keys get-key-string $KEY_NAME --format="value(keyString)")
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
gsutil mb gs://$PROJECT_ID
git clone https://github.com/G-Tech-007/Arcade-February-2024.git
gsutil cp Arcade-February-2024/donuts.png gs://$PROJECT_ID
gsutil cp Arcade-February-2024/selfie.png gs://$PROJECT_ID
gsutil cp Arcade-February-2024/city.png gs://$PROJECT_ID
gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/donuts.png
gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/selfie.png
gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/city.png
