echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
echo 'Cloning or Updating Kernel Stuff'

# Function to clone or update a repository
clone_or_update() {
    local repo_url="$1"
    local branch="$2"
    local target_dir="$3"

    if [ -d "$target_dir/.git" ]; then
        echo "Updating existing repository in $target_dir..."
        (
            cd "$target_dir" || exit 1
            git fetch origin
            git checkout -B "$branch" "origin/$branch"
            git reset --hard "origin/$branch"
            # git clean -fd
        )
    else
        echo "Cloning $target_dir..."
        rm -rf "$target_dir"
        git clone -b "$branch" "$repo_url" "$target_dir"
    fi
}

# Clone or Update repos
clone_or_update "https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git" "seventeen" "kernel/xiaomi/sm7435"
clone_or_update "https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-modules.git" "seventeen" "kernel/xiaomi/sm7435-modules"
clone_or_update "https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-devicetrees.git" "seventeen" "kernel/xiaomi/sm7435-devicetrees"

# Submodule Update
(
    cd kernel/xiaomi/sm7435 || exit 1
    git submodule update --init --recursive
)

# Signing Stuff
if [ ! -f "vendor/custom-priv/keys/keys.mk" ]; then
    echo "Keys not found or incomplete. Setting up..."
    rm -rf vendor/custom-priv/keys
    git clone --depth=1 https://github.com/Lafactorial/vendor_custom-priv_keys-template vendor/custom-priv/keys
    (
        cd vendor/custom-priv/keys || exit 1
        rm -f testkey.pk8 testkey.x509.pem
        ./keys.sh || true
    )
else
    echo "Existing keys found — keeping them"
fi

# Camera Stuff
echo 'Cloning or Updating Camera Stuff'

clone_or_update "https://gitea.com/Lafactorial/android_device_xiaomi_garnet-miuicamera.git" "17" "device/xiaomi/garnet-miuicamera"
clone_or_update "https://gitea.com/Lafactorial/proprietary_vendor_xiaomi_garnet-miuicamera.git" "17" "vendor/xiaomi/garnet-miuicamera"

echo 'Cloning process is completed, now its time for lunch'