#!/bin/bash

echo "🚀 Starting environment setup..."

# Step 1: Create and activate virtual environment
echo "📦 Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Step 2: Upgrade pip and install dependencies
echo "📥 Installing required Python packages..."
pip install --upgrade pip
pip install flask pymongo python-dotenv

# Step 3: Create .env file
echo "🔐 Creating .env file..."
cat > .env <<EOL
MONGO_URI=mongodb+srv://<USERNAME>:<PASSWORD>@<CLUSTER>.mongodb.net/<DATABASE>?retryWrites=true&w=majority
SECRET_KEY=$(openssl rand -hex 24)
EOL
echo "⚠️  Replace <USERNAME>, <PASSWORD>, <CLUSTER>, and <DATABASE> in .env manually."

# Step 4: Show file structure
echo "📁 Creating recommended project structure..."

mkdir -p static templates
touch app.py

# Step 5: Final instructions
echo -e "\n✅ Setup Complete!"
echo "👉 Activate the environment with: source venv/bin/activate"
echo "👉 Run the app using: python app.py"
