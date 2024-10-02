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
setup_wallet() {
    KEYPAIR_DIR="$HOME/solana_keypairs"
    mkdir -p "$KEYPAIR_DIR"

    show "Do you want to use an existing wallet or create a new one?"
    PS3="Please enter your choice (1 or 2): "
    options=("Use existing wallet" "Create new wallet")
    select opt in "${options[@]}"; do
        case $opt in
            "Use existing wallet")
                show "Recovering from existing wallet..."
                KEYPAIR_PATH="$KEYPAIR_DIR/eclipse-wallet.json"
                solana-keygen recover -o "$KEYPAIR_PATH" --force
                if [[ $? -ne 0 ]]; then
                    show "Failed to recover the existing wallet. Exiting."
                    exit 1
                fi
                break
                ;;
            "Create new wallet")
                show "Creating a new wallet..."
                KEYPAIR_PATH="$KEYPAIR_DIR/eclipse-wallet.json"
                solana-keygen new -o "$KEYPAIR_PATH" --force
                if [[ $? -ne 0 ]]; then
                    show "Failed to create a new wallet. Exiting."
                    exit 1
                fi
                break
                ;;
            *) show "Invalid option. Please try again." ;;
        esac
    done

    solana config set --keypair "$KEYPAIR_PATH"
    show "Wallet setup completed!"

    cp "$KEYPAIR_PATH" "$PWD"
}


- Creat new if you don't have a SOON address
```Bash
solana-keygen new
```
- Recover old Wallet
```Bash
solana-keygen recover 'prompt://?key=0/0' --outfile ~/.config/solana/id.json
```
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


























