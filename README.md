# nvim_avante

# 🚀 AI-Powered Neovim Setup  

Turn your Neovim into an **AI-assisted coding IDE** using open-source tools! This setup integrates **Large Language Models (LLMs)** directly into Neovim, providing intelligent code suggestions, completions, and assistance—without the need for costly subscriptions.  

## 🛠️ Installation Guide  

### 1️⃣ Install Neovim  

Before setting up the AI integration, you need to install Neovim.  

#### **For Linux (Debian/Ubuntu-based)**  
```bash
sudo apt update && sudo apt install neovim -y
```
#### **For Linux (Arch-based)**  
```bash
sudo pacman -S neovim
```
#### **For Linux (Fedora/RHEL-based)**  
```bash
sudo dnf install neovim -y
```
#### **For macOS (Homebrew)**  
```bash
brew install neovim
```

Once installed, verify the installation:
```bash
nvim --version
```
### 2️⃣ Clone This Repository
```bashe
git clone https://github.com/notablenomads/nvim_avante.git
```

### 3️⃣ Configure the neovim plugins 
copy the project .configs/nvim directory to your corresponding directory 
by default it should be on your 
```bash
$HOME/.config/nvim
```
open your nvim and the insert this command
```bash
:Lazy sync 
```

### 4️⃣ Configure Your AI Provider
The available LLM providers are listed in avante.lua. Most of them work out-of-the-box, but if you plan to use Ollama or your own self-hosted LLM/SLM , keep in mind:
## ⚠️ Performance Warning: Running local models requires a powerful GPU for smooth performance. We tested this setup on a Mac M4, and the results were extremely slow without dedicated GPU acceleration. If you are using a CPU-only machine, cloud-based models are recommended.
( for instance i tested the ollama with qwen model on the mac M4 and the result was insanely slow :D ) 
for selecting your prefered model you can write this on your nvim:
```bash
:AvanteModels
```
and choose your prefered model.
Or you can directly edit the `/nvim/lua/plugins/avante.lua` file and set it manually: 
```bash
nvim $HOME/.config/nvim/lua/plugins/avante.lua
```
in line 7 change your provider name and choose a model from the provided options on the opts object, default is on openrouter.

### 5️⃣ Launch Neovim and Enjoy!
```bash
nvim
```



