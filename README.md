# soon-devnet
## 1. Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

rustup default 1.79.0

rustc --version
## 2. Install Solana CLI

sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
solana --version
sudo apt install gcc
gcc --version

## 3. Install Anchor CLI
cargo install --git https://github.com/coral-xyz/anchor avm --force
avm --version
avm install latest
avm use latest
anchor --version
anchor-cli 0.30.1
## 4. Install Node.js, Yarn & pnpm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
command -v nvm
nvm install node
node --version
v22.9.0
- Yarn and pnpm Installation
npm install -g yarn
yarn --version
1.22.22
  
npm install -g pnpm
pnpm --version
9.11.0
## 5. SOON RPC Configuration & New Key Pair
- Configuring the Solana CLI to Use SOON Devnet
solana config set --url https://rpc.devnet.soo.network/rpc

solana config get
You should see an output that includes the following URL:

Copy
Config File: /home/xxxx
RPC URL: https://rpc.devnet.soo.network/rpc
WebSocket URL: wss://rpc.devnet.soo.network/rpc (computed)
Keypair Path: /home/xxxxx
Commitment: confirmed

- Creat new
solana-keygen new
- Recover old Wallet
solana-keygen recover 'prompt://?key=0/0' --outfile ~/.config/solana/id.json

Get Test Tokens via SOON Faucet
You can get test tokens via SOON Faucet.

We now support Sepolia ETH and $P(erc-20 format meme token).

You can also check the basic guide for Devnet:

SOON Devnet Guide
## 6. Deploy a Smart Contract on SOON(Hello World)
### - Clone the Repository
git clone https://github.com/soonlabs/hello-world && cd hello-world

### - Build the Project
cd example-hello-world/src/program-rust
cargo build-sbf

### - Set Up the RPC URL for SOON Devnet
** If you have configured that and had SOL already, you can skip this step.
solana config set --url https://rpc.devnet.soo.network/rpc
### - Deploy the Program
solana program deploy ./target/deploy/helloworld.so
## 6. Interact with the Contract(Frontend)
cd hello-world/front-end
pnpm i
pnpm dev

You can now access your front-end page through the local path. The default path in the code is set to the local environment: http://localhost:3000
Front-end display effect
You can see a simple webpage with a button in the middle and a wallet in the upper right corner.
Click the button to call the wallet to sign the transaction and send it to SOON Devnet RPC.
When you successfully send a transaction, the browser will send a toast to remind you of success.
And now you can check the transaction on SOON Devnet Explorer:

explorer.devnet.soo.network

You can see in the log that the message has been correctly transmitted.

## 7. Interact with the Contract (Backend)
Change into the project directory:
cd hello-world/backend
pnpm i
pnpm start

After confirmation, you can check the transaction on SOON Devnet Explorer:

explorer.devnet.soo.network



























