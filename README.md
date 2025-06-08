# 📣 Send Deployment URL to Jira

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Send%20Deployment%20URL%20to%20Jira-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4n3NQ==)](https://github.com/marketplace/actions/send-deployment-url-to-jira)
[![Actions Status](https://github.com/fordeer/send-jira-deployment-action/workflows/test/badge.svg)](https://github.com/fordeer/send-jira-deployment-action/actions)

Automatically posts deployment URLs to associated Jira issues based on Pull Request titles. Perfect for streamlining your deployment workflow and keeping stakeholders informed.

## ✨ Features

- 🔍 **Smart Jira Key Detection** - Automatically extracts Jira issue keys from PR titles
- 🎨 **Customizable Message Templates** - Fully customizable comment format
- 🏷️ **Flexible Project Prefixes** - Support for any project naming convention (FC, DEV, PROJ, etc.)
- 🛡️ **Robust Error Handling** - Comprehensive logging and error recovery
- 🔄 **Reusable & Configurable** - Easy to integrate into existing workflows

## 🚀 Quick Start

```yaml
name: Deploy and Notify Jira
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  deploy-and-notify:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to staging
        # Your deployment steps here...
        run: echo "DEPLOY_URL=https://staging.example.com" >> $GITHUB_ENV
        
      - name: 📣 Send Deployment URL to Jira
        uses: fordeer/send-jira-deployment-action@v1
        with:
          jira_base_url: ${{ secrets.JIRA_BASE_URL }}
          jira_username: ${{ secrets.JIRA_USERNAME }}
          jira_api_token: ${{ secrets.JIRA_API_TOKEN }}
          deployment_url: ${{ env.DEPLOY_URL }}
          jira_project_prefix: 'FC'  # Your project prefix
```

## 📖 Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `jira_base_url` | JIRA base URL (e.g., https://your-domain.atlassian.net) | ✅ | - |
| `jira_username` | JIRA username/email | ✅ | - |
| `jira_api_token` | JIRA API token | ✅ | - |
| `deployment_url` | Deployment URL to send to Jira | ✅ | - |
| `jira_project_prefix` | Jira project prefix (e.g., FC, DEV, PROJ) | ❌ | `FC` |
| `pr_title` | Pull Request title | ❌ | `${{ github.event.pull_request.title }}` |
| `jira_key_pattern` | Custom regex pattern (overrides prefix) | ❌ | - |
| `message_template` | Custom message template | ❌ | `🚀 [Deployment URL]({deployment_url}) is ready for testing! 🔗` |

## 📤 Outputs

| Output | Description |
|--------|-------------|
| `jira_issue_key` | Extracted Jira issue key |
| `comment_posted` | Whether comment was successfully posted (true/false) |

## 🎯 Use Cases

### Basic Usage
```yaml
- uses: fordeer/send-jira-deployment-action@v1
  with:
    jira_base_url: ${{ secrets.JIRA_BASE_URL }}
    jira_username: ${{ secrets.JIRA_USERNAME }}
    jira_api_token: ${{ secrets.JIRA_API_TOKEN }}
    deployment_url: ${{ env.DEPLOY_URL }}
```

### Custom Project Prefix
```yaml
- uses: fordeer/send-jira-deployment-action@v1
  with:
    jira_base_url: ${{ secrets.JIRA_BASE_URL }}
    jira_username: ${{ secrets.JIRA_USERNAME }}
    jira_api_token: ${{ secrets.JIRA_API_TOKEN }}
    deployment_url: ${{ env.DEPLOY_URL }}
    jira_project_prefix: 'DEV'  # Will match DEV-123, dev-456, etc.
```

### Custom Message Template
```yaml
- uses: fordeer/send-jira-deployment-action@v1
  with:
    jira_base_url: ${{ secrets.JIRA_BASE_URL }}
    jira_username: ${{ secrets.JIRA_USERNAME }}
    jira_api_token: ${{ secrets.JIRA_API_TOKEN }}
    deployment_url: ${{ env.DEPLOY_URL }}
    message_template: '✅ Staging environment updated: {deployment_url} 🎉'
```

### Advanced Pattern Matching
```yaml
- uses: fordeer/send-jira-deployment-action@v1
  with:
    jira_base_url: ${{ secrets.JIRA_BASE_URL }}
    jira_username: ${{ secrets.JIRA_USERNAME }}
    jira_api_token: ${{ secrets.JIRA_API_TOKEN }}
    deployment_url: ${{ env.DEPLOY_URL }}
    jira_key_pattern: '(task|bug|feature)[- ]?[0-9]+'
```

## 🔧 Setup

### 1. Get Jira API Token
1. Go to [Atlassian Account Settings](https://id.atlassian.com/manage/api-tokens)
2. Create API token
3. Copy the token

### 2. Add GitHub Secrets
Add these secrets to your repository (`Settings > Secrets and variables > Actions`):

- `JIRA_BASE_URL`: Your Jira URL (e.g., `https://your-domain.atlassian.net`)
- `JIRA_USERNAME`: Your Jira email
- `JIRA_API_TOKEN`: The API token from step 1

### 3. PR Title Format
Make sure your PR titles include the Jira issue key:
- ✅ `FC-123: Add new login feature`
- ✅ `Fix bug FC-456 in payment flow`
- ✅ `PROJ 789: Update documentation`
- ❌ `Add new feature` (no Jira key)

## 🎨 Message Template Variables

You can use these variables in your `message_template`:
- `{deployment_url}` - The deployment URL

Example templates:
```yaml
message_template: '🚀 [Preview]({deployment_url}) ready for review!'
message_template: '✅ Changes deployed to {deployment_url} 🎉'
message_template: 'Test the changes: {deployment_url}'
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Support

If this action helped you, please give it a star! ⭐

Found a bug or have a feature request? [Open an issue](https://github.com/fordeer/send-jira-deployment-action/issues).