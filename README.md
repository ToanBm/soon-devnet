# Building on SOON Devnet

## 1. Install Rust
```Bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```
```Bash
. "$HOME/.cargo/env"
```
```Bash
rustup default 1.79.0
```
```Bash
rustc --version
```
- Result `rustc 1.79.0 (129f3b996 2024-06-10)`
## 2. Install Solana CLI
```Bash
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
```
```Bash
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
```
```Bash
solana --version
```
- Result `solana-cli 1.18.24 (src:7ba2a0e9; feat:3241752014, client:Agave)`
```Bash
sudo apt install gcc
```
```Bash
gcc --version
```
- Result `gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0`
## 3. Install Anchor CLI
```Bash
cargo install --git https://github.com/coral-xyz/anchor avm --force
```
```Bash
avm --version
```
```Bash
avm install latest
avm use latest
```
```Bash
anchor --version
```
- Result `Now using anchor version 0.30.1.`
## 4. Install Node.js, Yarn & pnpm
### - Node.js Installation
```Bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```
```Bash
command -v nvm
```
```Bash
nvm install node
```
```Bash
node --version
```
- Result `v22.9.0`
### - Yarn and pnpm Installation
```Bash
npm install -g yarn
```
```Bash
yarn --version
```
- Result `1.22.22`
```Bash
npm install -g pnpm
```
```Bash
pnpm --version
```
- Result `9.11.0`
## 5. SOON RPC Configuration & New Key Pair
### - Configuring the Solana CLI to Use SOON Devnet
```Bash
solana config set --url https://rpc.devnet.soo.network/rpc
```
```Bash
solana config get
```
You should see an output that includes the following URL:
```Bash
Config File: /home/xxxx
RPC URL: https://rpc.devnet.soo.network/rpc
WebSocket URL: wss://rpc.devnet.soo.network/rpc (computed)
Keypair Path: /home/xxxxx
Commitment: confirmed
```
### - Solana Wallet
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
Picture
And now you can check the transaction on SOON Devnet Explorer:
explorer.devnet.soo.network
You can see in the log that the message has been correctly transmitted.
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



























