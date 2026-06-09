# ⚡ Opencode + Hindsight Local-First AI Agent Pipeline

> **Build without limits. Hack without a credit card. Infinite context without the invoice.**

An elite, **100% free-tier** AI developer setup designed for students, fast-paced hackathon participants, and developers exploring agentic workflows. By combining **Opencode's** open orchestration framework, the blistering speed of **Gemini 3.1 Flash-Lite**, and **Hindsight's** persistent local memory engine, you get a codebase companion that learns your style, remembers your design decisions, and never runs out of context window.

---

## 🚀 Why This Setup Wins Hackathons

| Feature | The Status Quo 🛑 | This Setup 🚀 |
| --- | --- | --- |
| **Cost** | Subscriptions or pay-per-token API drain | **$0.00** (Powered by Google's generous free tier) |
| **Context Window** | Sinks under the weight of giant file trees | **1 Million Tokens** (Easily swallows massive repos) |
| **Daily Limits** | Constantly hitting restrictive usage caps | **1,000 requests per day** (Virtually impossible for a single hacker to exhaust) |
| **Memory** | Forgets everything the moment you clear terminal | **Persistent local vector index** via Hindsight |
| **Velocity** | Manual copy-pasting of error logs | Autonomous self-correction & memory loops via MCP |

---

## 🛠️ Architecture at a Glance

This setup runs on a highly efficient, dual-engine cycle:

1. **The Brain (Opencode + Gemini 3.1 Flash-Lite):** Handles file analysis, structure planning, and code writing at blazing speeds.
2. **The Memory (Hindsight + Gemini 2.5 Flash):** An asynchronous Model Context Protocol (MCP) layer running locally. It auto-ingests your preferences, project constraints, and architectural milestones, creating an external long-term brain.

---

## 📋 Prerequisites

Before spinning up, make sure you have the following installed on your machine:

* **Node.js** (v18+) & **npm** / **bun**
* **Opencode CLI** (`npm install -g opencode`)
* **Hindsight CLI** with local MCP capability (`pip install hindsight-mcp` or equivalent native binary)

---

## ⚙️ Core Configuration Step: Selecting the Model

To unlock the full potential of this environment, you must explicitly point your local environment to the correct engine.

### Why Gemini 3.1 Flash-Lite?

* **1M Token Context Window:** You can load massive file trees, large boilerplate frameworks, and multiple documentation files simultaneously without running out of memory or confusing the agent.
* **1,000 Free Requests/Day:** Google's free-tier threshold offers an aggressive pool of 1,000 requests daily. As a solo developer or student in an intense 24-48 hour hackathon, you can run continuously without hitting limits or spending a dime.

### How to Select It in Opencode

1. Launch the configuration settings or model registry by running:
```bash
opencode models

```


2. Navigate the interactive TUI menu using your arrow keys to find the Google provider section.
3. Select **`gemini-3.1-flash-lite`** and set it as your primary model for both the **`plan`** and **`build`** agent execution layers.

---

## ⚡ Quick Start (Automated Setup)

Clone this repository and spin up the complete environment in seconds:

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name

# 2. Inject your free Gemini API Key securely into your session
export HINDSIGHT_API_LLM_API_KEY="your_free_gemini_api_key_here"

# 3. Run the installer script
chmod +x setup_opencode.sh
./setup_opencode.sh

```

The script automatically generates the `./opencode/` workspace directory, injects the optimal `opencode.json` matrix config, and sets up your `AGENTS.md` cognitive instruction pipeline.

---

## 🧠 The Long-Term Memory Pipeline

Your agent doesn't just read code; it evolves with your project. The workflow is managed entirely by `opencode/AGENTS.md` across three transparent phases:

### 1. Context Retrieval (Recall)

When you ask deep contextual questions, the agent silently queries its local index instead of re-reading your entire project folder:

```bash
hindsight-embed memory recall default "<search keywords>"

```

### 2. Context Ingestion (Retain)

When you complete a crucial feature or state a global preference (e.g., *"We are using Tailwind and strict TypeScript types"*), the agent anchors it instantly:

```bash
hindsight-embed memory retain default "<the explicit fact>"

```

### 3. Memory Consolidation (Reflect)

To prevent cognitive clutter during intense 24-hour hackathons, the agent automatically executes background housecleaning:

```bash
hindsight-embed memory reflect default

```

---

## 🛡️ Security Best Practices

* **Zero Key Leakage:** The setup script reads `HINDSIGHT_API_LLM_API_KEY` straight from your shell environment. **Your raw API keys are never hardcoded into files.**
* **Git Guard:** The generated `opencode/opencode.json` file contains your execution context. It is strictly recommended to add it to your `.gitignore`:
```bash
echo "opencode/opencode.json" >> .gitignore

```



---

## 💡 Pro Hackathon Tips

* **The "Shift-Pivot" Strategy:** If your hackathon team decides to completely change directions at 3:00 AM, just run a `hindsight-embed memory reflect default` clear pass, tell the agent the new project constraints, and watch it seamlessly adapt without getting stuck on old code patterns.
* **Multi-Model Fallbacks:** Because Opencode abstracts your configuration, you can swap models instantly in `opencode.json` without breaking your memory schema or modifying a single script.

---

## 🤝 Contributing & Learning

This project was built to show students and developers how to tap into production-grade agentic pipelines completely free of charge. If you find optimization tweaks for the `AGENTS.md` pipeline prompts, feel free to open a Pull Request!