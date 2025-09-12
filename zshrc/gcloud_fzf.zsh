# ~/.gcloud_fzf.zsh
# FZF-powered GCP helpers for use with gcloud CLI

# 🧠 Ensure fzf is installed
if ! command -v fzf &>/dev/null; then
  echo "⚠️ fzf not found in PATH. Install it to use gcloud_fzf functions."
  return 1
fi

# Source gcloud bash completion in Zsh
if [ -f /usr/lib/google-cloud-sdk/completion.bash.inc ]; then
  source /usr/lib/google-cloud-sdk/completion.bash.inc
fi

# 📁 1. Select and set GCP project
gcloud_fzf_select_project() {
  local project
  project=$(gcloud projects list --format="value(projectId)" | fzf --prompt="Select GCP Project: ")
  if [[ -n "$project" ]]; then
    gcloud config set project "$project"
    echo "✔ GCP project set to: $project"
  else
    echo "❌ No project selected."
  fi
}

# 🌐 2. Select a VPC network
gcloud_fzf_select_vpc() {
  gcloud compute networks list \
    --format="table(name,subnetMode,bgpRoutingMode)" |
    fzf --prompt="Select VPC: "
}

# 🧵 3. Select a subnet
gcloud_fzf_select_subnet() {
  gcloud compute networks subnets list \
    --format="table(name,region,network,ipCidrRange)" |
    fzf --prompt="Select Subnet: "
}

# 🔐 4. Select a service account
gcloud_fzf_select_sa() {
  gcloud iam service-accounts list --format="value(email)" |
    fzf --prompt="Select Service Account: "
}

# 🛡️ 5. View IAM roles
gcloud_fzf_list_roles() {
  gcloud iam roles list --format="table(name,title,stage)" |
    fzf --prompt="Select IAM Role: "
}

kctx() {
  local context
  context=$(kubectl config get-contexts -o name | fzf --prompt="Select Kubernetes Context: ")
  if [[ -n "$context" ]]; then
    kubectl config use-context "$context"
  else
    echo "❌ No context selected."
  fi
}

# ☸️ Describe a GKE cluster

gkedesc() {
  local cluster location
  cluster=$(gcloud container clusters list --format="value(name)" | fzf --prompt="Select GKE Cluster to Describe: ")
  
  if [[ -n "$cluster" ]]; then
    location=$(gcloud container clusters list --filter="name=$cluster" --format="value(location)")
    
    if [[ -n "$location" ]]; then
      echo "🔎 Describing cluster '$cluster' in location '$location'..."
      # This line is now piped to less
      gcloud container clusters describe "$cluster" --location "$location" | less -R
    else
      echo "❌ Could not find a location for cluster '$cluster'."
    fi
  else
    echo "❌ No cluster selected."
  fi
}

# ☸️ 6. Select and connect to a GKE cluster
gcloud_fzf_connect_gke() {
  local cluster location
  cluster=$(gcloud container clusters list --format="value(name)" | fzf --prompt="Select GKE Cluster: ")
  if [[ -n "$cluster" ]]; then
    location=$(gcloud container clusters list --filter="name=$cluster" --format="value(location)")
    if [[ -n "$location" ]]; then
      echo "📡 Connecting to cluster '$cluster' in location '$location'..."
      gcloud container clusters get-credentials "$cluster" --region "$location" 2>/dev/null || \
      gcloud container clusters get-credentials "$cluster" --zone "$location"
    else
      echo "❌ Could not determine location for cluster: $cluster"
    fi
  else
    echo "❌ No GKE cluster selected."
  fi
}

# 🧪 Optional: Select compute instance to SSH into
gcloud_fzf_ssh_instance() {
  local instance
  instance=$(gcloud compute instances list --format="value(name)" | fzf --prompt="Select Instance to SSH: ")
  if [[ -n "$instance" ]]; then
    gcloud compute ssh "$instance"
  else
    echo "❌ No instance selected."
  fi
}

# ⚙️ Aliases for convenience
alias gproj="gcloud_fzf_select_project"
alias gvpc="gcloud_fzf_select_vpc"
alias gsubnet="gcloud_fzf_select_subnet"
alias gsa="gcloud_fzf_select_sa"
alias giamroles="gcloud_fzf_list_roles"
alias ggke="gcloud_fzf_connect_gke"
alias gssh="gcloud_fzf_ssh_instance"
alias gkec='gcloud container clusters create'
alias gkeg='gcloud container clusters get-credentials'
alias gkel='gcloud container clusters list'
alias gked='gcloud container clusters delete'
alias gker='gcloud container clusters resize'
alias gal='gcloud auth login'

ghelp() {
  echo -e "\n\033[1;36m🌩️  GCP Command Shortcuts — fzf-enhanced + gcloud aliases\033[0m\n"

  echo -e "\033[1;33m#Login\033[0m"
  echo -e "  \033[1;32mgal\033[0m         → Google Auth Login\n"

  echo -e "\033[1;33m# Project & IAM\033[0m"
  echo -e "  \033[1;32mgproj\033[0m       → Select and set active GCP project using fzf"
  echo -e "  \033[1;32mgsa\033[0m         → Fuzzy-select a Service Account"
  echo -e "  \033[1;32mgiamroles\033[0m   → Fuzzy-browse IAM roles"

  echo -e "\n\033[1;33m# Networking\033[0m"
  echo -e "  \033[1;32mgvpc\033[0m        → Fuzzy-select a VPC network"
  echo -e "  \033[1;32mgsubnet\033[0m     → Fuzzy-select a subnet"

  echo -e "\n\033[1;33m# Compute\033[0m"
  echo -e "  \033[1;32mgssh\033[0m        → SSH into a Compute Engine instance via fzf"

  echo -e "\n\033[1;33m# Kubernetes (GKE)\033[0m"
  echo -e "  \033[1;32mggke\033[0m        → Fuzzy-select and connect to a GKE cluster (slow, fetches credentials)"
  echo -e "  \033[1;32mkctx\033[0m        → Fuzzy-select a kubectl context (fast switching)"
  echo -e "  \033[1;32mgkec\033[0m        → Create a new GKE cluster"
  echo -e "  \033[1;32mgkeg\033[0m        → Get credentials for a GKE cluster"
  echo -e "  \033[1;32mgkel\033[0m        → List all GKE clusters"
  echo -e "  \033[1;32mgked\033[0m        → Delete a GKE cluster"
  echo -e "  \033[1;32mgkedesc\033[0m     → Describe a GKE cluster"
  echo -e "  \033[1;32mgker\033[0m        → Resize a GKE cluster"

  echo -e "\n\033[1;34mTip:\033[0m Use \033[1;36mfzf\033[0m to navigate large lists quickly."
  echo -e "Run \033[1;32mghelp\033[0m anytime to see this message again.\n"
}
