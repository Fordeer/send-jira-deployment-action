# Contributing to Send Jira Deployment Action

Cảm ơn anh đã quan tâm đến việc đóng góp cho dự án! 🎉

## 🚀 Quick Start

1. **Fork repository**
2. **Clone locally**:
   ```bash
   git clone https://github.com/your-username/send-jira-deployment-action.git
   cd send-jira-deployment-action
   ```
3. **Tạo branch mới**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Thực hiện thay đổi**
5. **Test action**:
   ```bash
   # Run test workflow
   git push origin feature/your-feature-name
   ```
6. **Tạo Pull Request**

## 🔧 Development Guidelines

### Code Style
- Sử dụng shell script chuẩn POSIX
- Comments bằng tiếng Anh
- Tên biến rõ ràng và nhất quán
- Error handling đầy đủ

### Testing
- Test tất cả các trường hợp sử dụng
- Bao gồm negative cases
- Validate với các project prefix khác nhau
- Test message template customization

### Documentation
- Cập nhật README.md nếu thêm tính năng mới
- Thêm examples cho use cases mới
- Cập nhật CHANGELOG.md

## 🐛 Bug Reports

Khi báo cáo bug, vui lòng bao gồm:
- **Mô tả ngắn gọn về bug**
- **Steps to reproduce**
- **Expected behavior**
- **Actual behavior**
- **Environment** (GitHub Actions runner, etc.)
- **Logs** nếu có

## 💡 Feature Requests

Khi đề xuất tính năng mới:
- **Use case cụ thể**
- **Lợi ích mang lại**
- **API design đề xuất** (nếu có)
- **Backward compatibility**

## 📋 Pull Request Process

1. **Đảm bảo tests pass**
2. **Cập nhật documentation**
3. **Thêm entry vào CHANGELOG.md**
4. **Squash commits nếu cần**
5. **Descriptive PR title và description**

### Commit Messages
- Sử dụng [Conventional Commits](https://conventionalcommits.org/)
- Ví dụ:
  - `feat: add support for custom headers`
  - `fix: handle empty PR titles gracefully`
  - `docs: update README examples`
  - `test: add test for custom patterns`

## 🔄 Release Process

1. **Update version** trong action.yml
2. **Update CHANGELOG.md**
3. **Create release tag**:
   ```bash
   git tag v1.1.0
   git push origin v1.1.0
   ```
4. **Update major version tag**:
   ```bash
   git tag -f v1
   git push origin v1 --force
   ```

## 📞 Support

- **GitHub Issues**: Bug reports và feature requests
- **GitHub Discussions**: General questions
- **Email**: [support@fordeer.io](mailto:support@fordeer.io)

## 📄 License

Bằng việc đóng góp, anh đồng ý rằng contributions sẽ được licensed dưới MIT License.