# Set Team Permissions on GitHub Repositories using GitHub CLI

This script allows you to set **push access** for a specific team to multiple repositories listed in a file.

---

## ✅ Prerequisites

Before running the script, ensure you have the following:

1. **GitHub CLI installed**  
   [Installation instructions](https://cli.github.com/manual/installation)

   Or install via terminal:

   - **macOS (Homebrew)**:
     ```bash
     brew install gh
     ```

   - **Ubuntu/Debian**:
     ```bash
     sudo apt install gh
     ```

2. **Authenticated with GitHub CLI**

   Run:
   ```bash
   gh auth login
   ```

   Follow the prompts to authenticate with your GitHub account and select the correct organization.

---

## 📁 Input File Format

Create a file named `repos.txt` with each repository on a new line in the format:

```
"organization-name/repository-name"
```

Example:
```
"twincompany/trembolone-module"
"twincompany/testo-application"
```

> ⚠️ Include the quotes exactly as shown, or the script might misinterpret the values.

---

## ▶️ How to Use the Script

2. replace YOUR_ORG with the name of your organization:

   ```bash
   TEAM="YOUR_TEAM"
   ```

1. Make the script executable:

   ```bash
   chmod +x set_team_permissions.sh
   ```

2. Run the script by passing the file as an argument:

   ```bash
   ./set_team_permissions.sh repos.txt
   ```

The script will:

- Read each repo from the file.
- Extract the organization and repository names.
- Use `gh api` to assign `push` permissions to the yout team.

---

## 🧠 Customization

If you want to change the team or permission level, edit these lines in the script:

```bash
gh api ... -f permission=push
```

You can replace `push` with one of the following permission levels:

- `pull` (read-only)
- `push` (read/write)
- `admin` (full control)
- `maintain`
- `triage`

---

## 🛠 Troubleshooting

- ✅ Confirm you're authenticated: `gh auth status`
- 🔐 Make sure your user has permission to manage team access to repos
- 👥 Ensure the team exists under the organization
- 🧾 Check API rate limits if running on many repos: `gh api rate-limit`

---

## 📄 License

This script is provided as-is. Use it responsibly and test it in a safe environment before applying to critical repositories.