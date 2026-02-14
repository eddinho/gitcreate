# gitcreate

A bash script to create and push to a new GitHub repository directly from the command line. It automates the entire workflow: creating the remote repository, initializing git locally, and pushing your code.

## Features

- 🚀 Creates GitHub repositories via the GitHub API
- 🔒 Supports both private (default) and public repositories
- 🎨 Color-coded output for better readability
- ✅ Comprehensive error handling and validation
- 🔑 Token-based authentication (secure, follows GitHub best practices)
- 📝 Auto-generates README.md if not present
- 🌿 Uses modern `main` branch naming
- 🌐 Cross-platform browser opening support
- ⚙️ Configurable via git config

## Prerequisites

- **Git**: Must be installed and accessible from command line
  - Windows: Install [Git for Windows](https://gitforwindows.org/) (includes Git Bash and curl)
  - Linux/macOS: Usually pre-installed, or install via package manager
- **curl**: Required for API calls (included with Git for Windows, pre-installed on Linux/macOS)
- **GitHub Account**: You need a GitHub account and personal access token
- **Bash shell**: Git Bash on Windows, or native bash on Linux/macOS

## Installation

### Linux / macOS

```bash
# Clone the repository
git clone https://github.com/yourusername/gitcreate.git

# Copy to your PATH
sudo cp gitcreate/gitcreate /usr/local/bin/

# Make it executable
sudo chmod +x /usr/local/bin/gitcreate
```

### Windows (Git Bash / VS Code)

**Recommended Method** (works perfectly with VS Code's integrated terminal):

```bash
# Clone the repository
git clone https://github.com/yourusername/gitcreate.git
cd gitcreate

# Create a bin directory in your home folder
mkdir -p ~/bin

# Copy the script there
cp gitcreate ~/bin/
chmod +x ~/bin/gitcreate

# Add to PATH (add this line to ~/.bashrc or ~/.bash_profile)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# Reload your shell
source ~/.bashrc
```

**Quick Method** (run from current directory without installation):

```bash
cd /path/to/your/project
/path/to/gitcreate/gitcreate
```

**VS Code Note**: Make sure your integrated terminal is set to "Git Bash". You can check/change this by:
1. Open VS Code terminal
2. Click the dropdown next to the + icon
3. Select "Git Bash" as default profile

**Important for Windows**: If you edit the script file on Windows, make sure it has Unix line endings (LF, not CRLF). In VS Code, check the bottom-right corner and click "CRLF" to change it to "LF", or run:
```bash
sed -i 's/\r$//' ~/bin/gitcreate
```

### Manual Installation

Simply download the `gitcreate` file and place it anywhere in your system's PATH.

## Configuration

Before using `gitcreate`, you need to configure your GitHub credentials:

### 1. Set your GitHub username

```bash
git config --global github.user YOUR_GITHUB_USERNAME
```

### 2. Create and set a GitHub Personal Access Token

1. Go to [GitHub Settings → Tokens](https://github.com/settings/tokens)
2. Click "Generate new token (classic)"
3. Give it a descriptive name (e.g., "gitcreate script")
4. Select the following scopes:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `user` (Read user profile data)
5. Click "Generate token" and copy the token
6. Configure it in git:

```bash
git config --global github.token YOUR_PERSONAL_ACCESS_TOKEN
```

> **Security Note**: Personal access tokens are more secure than passwords and can be easily revoked. Never share your token or commit it to a repository.

## Usage

Navigate to your project directory and run:

```bash
gitcreate
```

### Options

```bash
gitcreate [OPTIONS]

Options:
  -h, --help     Show help message
  -p, --public   Create a public repository (default: private)
```

### Examples

#### Create a private repository (default)
```bash
cd my-project
gitcreate
```

#### Create a public repository
```bash
cd my-open-source-project
gitcreate --public
```

### Interactive Prompts

The script will interactively ask you for:

1. **Repository name** (defaults to current directory name)
2. **Repository description** (optional)
3. **Confirmation** before creating
4. **Open in browser** after successful creation

## What It Does

1. ✅ Validates that Git and curl are installed
2. ✅ Checks for GitHub credentials (username and token)
3. ✅ Prompts for repository name, description, and visibility
4. ✅ Creates the repository on GitHub via API
5. ✅ Creates a README.md file if it doesn't exist
6. ✅ Initializes Git repository (if not already initialized)
7. ✅ Commits all files
8. ✅ Renames branch to `main` (if needed)
9. ✅ Adds remote origin
10. ✅ Pushes code to GitHub
11. ✅ Optionally opens the repository in your browser

## Troubleshooting

### "GitHub username not found"
```bash
git config --global github.user YOUR_GITHUB_USERNAME
```

### "GitHub token not found"
```bash
git config --global github.token YOUR_PERSONAL_ACCESS_TOKEN
```

### "Failed to create repository"
- Check that your token has the correct scopes (`repo`, `user`)
- Verify the repository name is valid (letters, numbers, hyphens, underscores, periods)
- Ensure a repository with that name doesn't already exist in your account

### "Failed to push to GitHub"
- Check your internet connection
- Verify your token has `repo` scope
- Try pushing manually: `git push -u origin main`

## Security Best Practices

- 🔐 Never commit your GitHub token to a repository
- 🔄 Rotate tokens periodically
- 🗑️ Revoke tokens you no longer need
- 👁️ Use tokens with minimal required scopes
- 💻 Consider using different tokens for different machines/purposes

## Uninstallation

**Linux/macOS:**
```bash
sudo rm /usr/local/bin/gitcreate
git config --global --unset github.user
git config --global --unset github.token
```

**Windows:**
```bash
rm ~/bin/gitcreate
git config --global --unset github.user
git config --global --unset github.token
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

This project is provided as-is under the MIT License.

## Credits

- Original inspiration: [robwierzbowski's gist](https://gist.github.com/robwierzbowski/5430952)
- Improved and enhanced with modern GitHub API practices


