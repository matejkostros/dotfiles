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

# ghelp() has been consolidated into the universal help system
# Use: ghelp (which points to cloudhelp)
# Or:  python3 $HOME/dotfiles/zshrc/helper.py cloudhelp
# See: helper.yaml and helper.py for the unified help system
