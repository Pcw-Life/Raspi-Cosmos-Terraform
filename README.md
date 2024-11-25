
# 🌟 Cosmos Smarthome System Development

### **🌍 Project Overview**

Welcome to the Cosmos Smarthome System Development repository! This project provides an end-to-end solution for setting up a comprehensive smarthome system using Terraform, Docker, Cosmos Cloud, and other optional services. It enables seamless integration, secure credential management, and a modular setup for extensibility.

---

### **✨ Key Features**

- ✨ **Interactive Installer**: Automatically set up required software and manage optional add-ons.
- ⚙️ **Terraform Modules**: Provision infrastructure with minimal manual intervention.
- 🌐 **Cosmos Cloud Integration**: Simplify app management with ServApps and Cosmos Compose.
- 🔐 **1Password Integration**: Securely manage credentials for all services.
- 🚀 **GitHub Actions**: Automate and validate configurations through CI/CD pipelines.

[🔝 Back to Top](#🌟-cosmos-smarthome-system-development)

---

### **📦 Software Packages**

Here’s the list of software packages included in this project:

**Required:**

- 🔐 **1Password CLI**: Securely manage credentials.
- 🐙 **GitHub CLI**: Interact with GitHub repositories from the command line.
- 🐳 **Docker**: Containerization platform for running applications.
- ☁️ **Cloudflare Account**: Manage DNS, security, and networking services.
- 🔑 **1Password Connect Server**: API-based access to secure credentials.
- 🛠️ **Terraform**: Infrastructure as code for provisioning and managing resources.
- 🪐 **Cosmos Cloud**: Simplify service deployment with ServApps.

**Optional Software:**

- 🏠 **Home Assistant**: Home automation platform.
- 🧑‍💻 **Node-RED**: Low-code programming for event-driven applications.
- 📊 **Grafana Suite**: Includes all Grafana-related packages from Docker Hub.
- 🎛️ **Pi-hole**: Network-wide ad blocker.
- 📈 **Prometheus**: Monitoring system and time-series database.
- 🐶 **Datadog**: Cloud monitoring and security platform.
- 📦 **Portainer**: Docker container management GUI.

<div style="position: relative; width: 100%; height: 0; padding-top: 77.2727%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAGXNDQ8jNk/8-l-i9BOQFnP_PI1QLBQrA/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>
<a href="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAGXNDQ8jNk&#x2F;8-l-i9BOQFnP_PI1QLBQrA&#x2F;view?utm_content=DAGXNDQ8jNk&amp;utm_campaign=designshare&amp;utm_medium=embeds&amp;utm_source=link" target="_blank" rel="noopener">Terraform Infastructure</a> by PCWPROPS LLC

[🔝 Back to Top](#🌟-cosmos-smarthome-system-development)

---

### **🔗 Fork Me**

Want to use this project for your setup? Fork this repository and make it your own!

#### **How to Fork and Use**

1. Click the **Fork** button in the top-right corner of the repository page.
2. Clone your fork to your local machine:

   ```bash
   git clone https://github.com/<your-username>/Cosmos-Smarthome.git
   cd Cosmos-Smarthome
   ```

3. Follow the [GitHub Actions Setup](#🔧-step-by-step-setup) section to configure your environment.

#### **Collaborate and Contribute**

- 🐛 [Open an Issue](https://github.com/your-repo/issues) to report bugs or request features.
- 💬 [Join Discussions](https://github.com/your-repo/discussions) to share ideas or ask questions.
- 🔄 [Submit Pull Requests](https://github.com/your-repo/pulls) to contribute improvements or fixes.

[📦 Go to Software Packages](#📦-software-packages)

---

### **🤝 Sponsor Me**

Support the continued development and maintenance of this project! Sponsorships help fund future enhancements and ensure the project remains active.

#### **How to Sponsor**

- Visit the **Sponsor** section on the repository page.
- Choose a sponsorship tier and join the community of supporters!

[🔝 Back to Top](#🌟-cosmos-smarthome-system-development)

---

### **🔧 Step-by-Step Setup**

#### **1️⃣ Prerequisites**

Ensure the following are installed:

- Git
- Docker
- Terraform
- 1Password CLI

#### **2️⃣ Environment Configuration**

- Add `OP_CONNECT_HOST` and `OP_CONNECT_TOKEN` to your GitHub repository's environments:
  1. Go to **Settings > Environments**.
  2. Create or update the environments for ServingPi and JuliansPi.
  3. Add the required variables securely.

#### **3️⃣ Run the Installer**

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/Cosmos-Smarthome.git
   cd Cosmos-Smarthome
   ```

2. Run the interactive installer:

   ```bash
   bash scripts/installer.sh
   ```

3. Follow the prompts to install and configure services.

#### **4️⃣ Post-Setup**

- Use Terraform and Cosmos Cloud for managing infrastructure and services.
- Reference additional resources in the [💡 Resources and Acknowledgments](#💡-resources-and-acknowledgments) section.

[🔝 Back to Top](#🌟-cosmos-smarthome-system-development)

---

### **💡 Resources and Acknowledgments**

#### **Official Links**

- [🔐 1Password CLI Documentation](https://developer.1password.com/docs/cli)
- [🛠️ Terraform Documentation](https://www.terraform.io/docs)
- [🪐 Cosmos Cloud Documentation](https://cosmos-cloud.io/doc)

#### **Acknowledgments**

- 🙌 Thanks to the open-source community for tools and resources.
- ⭐ Special thanks to contributors who made this project possible.

[🔝 Back to Top](#🌟-cosmos-smarthome-system-development)

---

### **🔗 Fork Me & 🤝 Sponsor Me**

- [Fork This Repository 🔗](#🔗-fork-me)
- [Sponsor This Project 🤝](#🤝-sponsor-me)
