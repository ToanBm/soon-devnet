#!/bin/bash
BOLD=$(tput bold)
RESET=$(tput sgr0)
YELLOW=$(tput setaf 3)

# Logo
curl -s https://raw.githubusercontent.com/ToanBm/user-info/main/logo.sh | bash
sleep 3

print_command() {
  echo -e "${BOLD}${YELLOW}$1${RESET}"
}

## 1. Install Rust
print_command "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

rustc --version

## 2. Install Solana CLI
print_command "Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="/home/codespace/.local/share/solana/install/active_release/bin:$PATH"
solana --version

sudo apt install gcc
gcc --version

## 3. Install Anchor CLI
print_command "Installing Anchor CLI..."
cargo install --git https://github.com/coral-xyz/anchor avm --force
avm --version

avm install latest
avm use latest

anchor --version

## 4. Install Node.js, Yarn & pnpm
print_command "Installing Node.js, Yarn & pnpm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
command -v nvm
nvm install node
node --version

npm install -g yarn

yarn --version
npm install -g pnpm
pnpm --version

## 5. SOON RPC Configuration & New Key Pair
print_command "Configuring the Solana CLI to Use SOON Devnet"

solana config set --url https://rpc.testnet.soo.network/rpc
solana config get

### - Solana Wallet
#!/bin/bash

echo "Do you want to use an existing wallet or create a new one?"
echo "1) Use existing wallet"
echo "2) Create new wallet"
read -p "Please enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Recovering from existing wallet..."
        solana-keygen recover 'prompt://?key=0/0' --outfile ~/.config/solana/id.json
        ;;
    2)
        echo "Creating a new wallet..."
        solana-keygen new
        ;;
    *)
        echo "Tùy chọn không hợp lệ. Vui lòng chạy lại script và chọn 1 hoặc 2."
        ;;
esac

## 6. Deploy a Smart Contract on SOON(Hello World)
print_command "Deploy a Smart Contract on SOON (Hello World)"
### - Clone the Repository
print_command "Clone the Repository..."
git clone https://github.com/soonlabs/hello-world
cd hello-world

### - Build the Project
print_command "Build the Project..."
cd example-hello-world/src/program-rust
cargo build-sbf

### - Deploy the Program
print_command "Deploy the Program..."
solana program deploy ./target/deploy/helloworld.so

## 6. Interact with the Contract(Frontend)
print_command "Interact with the Contract(Frontend)..."
cd ../../../
cd front-end
pnpm i

pnpm dev

print_command "Choose Open Browser..."








