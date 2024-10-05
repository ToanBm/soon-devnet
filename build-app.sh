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

rustup default 1.79.0
rustc --version

## 2. Install Solana CLI
print_command "Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
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

solana config set --url https://rpc.devnet.soo.network/rpc
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

* Press ENTER to continue (no passworld)
* Choose "y" if recovered pubkey is your address
* Get Test Tokens via SOON Faucet
## 6. Deploy a Smart Contract on SOON(Hello World)
### - Clone the Repository
```Bash
git clone https://github.com/soonlabs/hello-world && cd hello-world
```
### - Build the Project
```Bash
cd example-hello-world/src/program-rust
cargo build-sbf
```
### - Set Up the RPC URL for SOON Devnet
** If you have configured that and had SOL already, you can skip this step.
```Bash
solana config set --url https://rpc.devnet.soo.network/rpc
```
### - Deploy the Program
```Bash
solana program deploy ./target/deploy/helloworld.so
```
- Result `Program Id: xxxxx`
## 6. Interact with the Contract(Frontend)
```Bash
cd ../../../
```
```Bash
cd front-end && pnpm i
```
```Bash
pnpm dev
```
* Choose `Open Browser`
* Connect Backpack wallet
![Picture](https://github.com/ToanBm/soon-devnet/blob/main/soon1.jpg)
* And now you can check the transaction on SOON Devnet Explorer:
 explorer.devnet.soo.network
* You can see in the log that the message has been correctly transmitted.
* Ctrl + C to next step
## 7. Interact with the Contract (Backend)
Change into the project directory:
```Bash
cd ../
```
```Bash
cd backend && pnpm i
```
```Bash
pnpm add bs58
```
```Bash
pnpm install --force
```
```Bash
pnpm start
```
* After confirmation, you can check the transaction on SOON Devnet Explorer:
explorer.devnet.soo.network


























