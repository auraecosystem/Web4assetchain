# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git submodule update --init --recursive
# Install Node.js and npm
sudo apt install nodejs npm

# Install Substrate CLI
cargo install --force --git https://github.com/paritytech/substrate substrate

# Clone Substrate Node Template
git clone https://github.com/substrate-developer-hub/substrate-node-template.git web4asset-node
cd web4asset-node

# Compile the Node
cargo build --release
git submodule update --init --recursive
mkdir docs
cp -r build/* docs/
docker compose down -v && docker compose up --build -d
truffle compile
truffle migrate --network development
npm install --save-dev webpack-dev-server
sudo certbot --nginx -d {your_domain_or_subdomain}
sudo bash -c "$(curl -fsSL https://dv.net/install.sh)"
git clone --recursive https://github.com/dv-net/dv-bundle.git
cd dv-bundle
cp .env.example .env  # Configure environment variables if necessary
docker compose up -d
# Update all submodules to the latest versions
git submodule update --remote

# Rebuild and restart services
docker compose up --build -d
