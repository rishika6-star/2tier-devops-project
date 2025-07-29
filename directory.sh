# Make root project folder if not present
mkdir -p ~/2tier-devops-project
cd ~/2tier-devops-project

# Application source code
mkdir -p application/frontend/public
mkdir -p application/backend

# Terraform files
mkdir -p terraform

# Screenshots and documentation
mkdir -p screenshots

# Create empty expected files (feel free to fill these later)
touch frontend.sh backend.sh deploy.sh build-and-push.sh README.md Jenkinsfile docker-commands.txt terraform-outputs.txt

# Terraform scripts (in terraform/)
touch terraform/main.tf terraform/outputs.tf terraform/variables.tf terraform/user-data-frontend.sh terraform/user-data-backend.sh

# App files
touch application/frontend/app.js application/frontend/Dockerfile application/frontend/package.json application/frontend/public/index.html
touch application/backend/Dockerfile application/backend/init.sql application/backend/my.cnf

echo "Project directory structure created under ~/2tier-devops-project"
