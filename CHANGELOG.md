# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2025-06-08

### Added
- ✨ Initial release of Jira deployment notification action
- 🔍 Smart Jira issue key extraction from PR titles
- 🎨 Customizable message templates with placeholder support
- 🏷️ Flexible project prefix configuration (FC, DEV, PROJ, etc.)
- 🛡️ Robust error handling and HTTP response validation
- 📤 Outputs for extracted Jira key and posting status
- 🔧 Support for custom regex patterns
- 📚 Comprehensive documentation and examples
- 🧪 Test workflows for validation

### Features
- Automatic detection of Jira issue keys in PR titles
- Support for multiple project naming conventions
- Case-insensitive pattern matching
- Graceful handling of PRs without Jira keys
- Detailed logging for debugging
- GitHub Marketplace ready structure