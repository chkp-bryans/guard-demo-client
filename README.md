# Agentic Demo - Complete Application

A sophisticated B2B sales demo platform featuring AI-powered chatbot, Lakera Guard integration, RAG capabilities, and ToolHive integration.

## 🚀 Features

- **Skinnable B2B Landing Page** with customizable branding
- **AI Chatbot** with ReAct agent architecture and smart autocomplete
- **Lakera Guard Integration** with blocking/watching modes for content moderation
- **Demo Prompt Corpus** with autocomplete functionality (right arrow key trigger)
- **RAG System** supporting file uploads and AI-generated seed packs
- **ToolHive Integration** via MCP tools
- **Admin Console** for complete configuration management
- **Export/Import** configuration as ZIP with selective sections (appearance, LLM, security, RAG, demo prompts, tools, etc.)

## 🏗️ Architecture

- **Frontend**: Vite + React + TypeScript + Tailwind CSS
- **Backend**: FastAPI + SQLite + ChromaDB
- **LLM**: OpenAI (chat + embeddings)
- **Vector DB**: ChromaDB for RAG
- **Security**: Lakera Guard for content moderation

## 📋 Prerequisites

- Python 3.8+
- Node.js 16+
- OpenAI API key
- Lakera API key (optional)

## 🛠️ Installation

### 1. Clone and Setup

```bash
git clone <repository-url>
cd guard-demo-client
```

## 🚀 Quick Start (Recommended)

### Fastest Method: Use start_all.py

The easiest way to get started is using the `start_all.py` script, which handles most of the setup for you:

```bash
# 1. First, create and activate a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 2. Then run the startup script
python start_all.py
```

**The script will:**
- Install all Python dependencies from `requirements.txt`
- Install all Node.js dependencies from `package.json`
- Start the backend server on port 8000
- Start the frontend server on port 3000
- Open your browser to the demo page

**Note:** You still need to create and activate the virtual environment first, but the script handles all the dependency installation and service startup for you.

## 🛠️ Manual Setup (Alternative)

If you prefer to set up the components manually or need more control:

### Backend Setup

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Start backend server
python start_backend.py
```

### Frontend Setup

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

### Running Both Services

**Terminal 1 - Backend:**
```bash
python start_backend.py
```

**Terminal 2 - Frontend:**
```bash
npm run dev
```

## 🌐 Access Points

- **Demo Page**: http://localhost:3000
- **Admin Console**: http://localhost:3000/admin
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs (if available)

## ⚙️ Configuration

### 1. Initial Setup

1. Navigate to the Admin Console at http://localhost:3000/admin
2. Go to the **Security** tab
3. Enter your OpenAI API key
4. Optionally enter your Lakera API key and enable Lakera Guard
5. Configure other settings as needed

### 2. Branding Customization

In the **Branding** tab:
- Set your business name and tagline
- Upload logo and hero images
- Customize hero text

### 3. LLM Configuration

In the **LLM** tab:
- Select OpenAI model (GPT-4o, GPT-4o-mini, etc.)
- Adjust temperature (0-10 scale)
- Customize system prompt

### 4. RAG Setup

In the **RAG** tab:
- Upload documents (PDF, MD, TXT, CSV)
- Generate AI-powered seed packs
- View ingested content

### 5. Tool Management

In the **Tools** tab:
- Add custom tools
- Configure MCP endpoints
- Test tool functionality

### 6. Demo Prompt Corpus

In the **Demo Prompts** tab:
- Create curated demo prompts for different scenarios
- Organize prompts by category (general, security, tools, rag, malicious)
- Set a **preferred LLM** per prompt (chat uses that model when the prompt is selected)
- Add tags for easy searching
- Mark prompts as malicious for security testing
- Track usage statistics

**Chat Autocomplete:**
- Start typing in the chat (minimum 2 characters)
- See real-time suggestions with autocomplete overlay
- Press **right arrow key (→)** to complete the current suggestion
- Click on suggestions in the dropdown to select them
- Escape key to dismiss suggestions

## 🔧 API Endpoints

All API routes are under the `/api` prefix.

### Config
- `GET /api/config` - Get current configuration
- `PUT /api/config` - Update configuration
- `GET /api/config/export` - Export config as a **ZIP file** (query: `?include=appearance,llm,...` and `?version=2`; omit include = safe default sections)
- `POST /api/config/import` - Import config from an exported **ZIP file** (merge by section)

### Chat
- `POST /api/chat` - Send message to AI assistant

### RAG
- `POST /api/rag/upload` - Upload documents
- `POST /api/rag/generate` - Generate AI content
- `GET /api/rag/search` - Search stored content

### Tools
- `GET /api/tools` - List tools
- `POST /api/tools` - Create tool
- `PUT /api/tools/{id}` - Update tool
- `DELETE /api/tools/{id}` - Delete tool
- `POST /api/tools/test/{id}` - Test tool

### Lakera
- `GET /api/lakera/last` - Get last guardrail result

### Demo Prompts
- `GET /api/demo-prompts` - List demo prompts
- `GET /api/demo-prompts/search` - Search demo prompts with autocomplete
- `POST /api/demo-prompts` - Create demo prompt
- `PUT /api/demo-prompts/{id}` - Update demo prompt
- `DELETE /api/demo-prompts/{id}` - Delete demo prompt
- `POST /api/demo-prompts/{id}/use` - Track prompt usage

## 📁 Project Structure

```
guard-demo-client/
├── backend/                 # FastAPI backend
│   ├── __init__.py
│   ├── main.py             # FastAPI app, config export/import
│   ├── models.py           # SQLAlchemy models
│   ├── schemas.py          # Pydantic schemas
│   ├── database.py         # Database connection
│   ├── openai_client.py    # OpenAI integration
│   ├── rag.py              # RAG service, ChromaDB
│   ├── lakera.py           # Lakera integration
│   ├── toolhive.py         # ToolHive service
│   └── agent.py            # ReAct agent
├── src/                    # React frontend
│   ├── components/         # React components
│   │   ├── ChatWidget.tsx  # Chat with autocomplete
│   │   ├── DemoPromptManager.tsx # Prompt management
│   │   ├── LakeraOverlay.tsx    # Guard results
│   │   └── ...
│   ├── pages/              # Page components
│   ├── services/           # API services
│   ├── types/              # TypeScript types
│   └── ...
├── data/                   # Data storage
│   ├── agentic_demo.db     # SQLite database
│   ├── chroma/             # ChromaDB vectors (default)
│   └── chroma_import/      # ChromaDB after import (if used)
├── uploads/                # Uploaded files
├── requirements.txt        # Python dependencies
├── package.json            # Node.js dependencies
├── start_all.py            # Start backend + frontend (recommended)
├── start_backend.py        # Backend-only startup
└── README.md               # This file
```

## 🎯 Demo Features

### Chat Interface
- Real-time chat with AI assistant
- Smart autocomplete with demo prompt corpus
- Tool usage tracking
- Lakera guardrail monitoring
- Message history

### Lakera Integration
- Content moderation with blocking/watching modes
- Guardrail enforcement (blocking mode) or monitoring (watching mode)
- Real-time status monitoring
- Detailed violation reporting with TL;DR summaries

### RAG Capabilities
- Document upload (PDF, MD, TXT, CSV)
- AI-generated content creation
- Semantic search
- Content chunking and embedding

### Tool Integration
- Calculator tool
- HTTP fetch tool
- Calendar lookup
- GitHub repository info
- Custom tool addition

### Demo Prompt Corpus
- Curated prompt library for consistent demos
- Category-based organization (general, security, tools, rag, malicious)
- Tag-based search and filtering
- Usage tracking and analytics
- Smart autocomplete in chat interface
- Right arrow key (→) completion trigger
- Visual indicators for malicious prompts
- Admin interface for prompt management

## 🔒 Security Features

- API key masking in UI
- Secure file upload validation
- Content moderation via Lakera
- Input sanitization
- CORS configuration

## 📦 Export/Import

Configuration is exported and imported as **ZIP files** (not JSON). You choose which sections to include.

### Export

1. Go to **Admin Console → Export/Import**.
2. Check the sections you want in the export:
   - **Appearance**, **LLM**, **Security**, **RAG scanning**, **Demo prompts**, **Tools**, **RAG** (default: all checked).
   - **API keys** and **Project IDs** are off by default (safe for sharing).
3. Click **Export**. A ZIP file is downloaded (e.g. `agentic_demo_config_2026-02-23T12-00-00.zip`).

The ZIP contains `metadata.json` (version 2.0, list of included sections), `config.json`, and section-specific files such as `demo_prompts.json`, `tools.json`, `rag_sources.json`, and the ChromaDB vector store when those sections are included.

### Import

1. Go to **Admin Console → Export/Import**.
2. Upload a previously exported **ZIP** file.
3. The app **merges by section**: only sections present in the ZIP are applied (e.g. a “safe” export does not overwrite your API keys or project IDs).
4. After import, a summary shows which sections were applied. RAG (ChromaDB) is loaded from the ZIP without replacing the live `data/chroma` directory in use; the app switches to the imported vectors so RAG keeps working.

**Tips:**

- For **demo prompts** to be in the export, include the **Demo prompts** section when exporting. Re-export after adding prompts if your current ZIP was created before that change.
- **v1.0** ZIPs (no `metadata.json` version 2.0 or old format) are still supported: full replace behavior, and demo prompts can be read from `demo_prompts.json` or from `data/agentic_demo.db` inside the ZIP.

## 🐛 Troubleshooting

### Common Issues

1. **Backend won't start**
   - Check Python version (3.8+)
   - Verify all dependencies installed
   - Check port 8000 availability

2. **Frontend won't start**
   - Check Node.js version (16+)
   - Run `npm install`
   - Check port 3000 availability

3. **API errors**
   - Verify OpenAI API key is set
   - Check network connectivity
   - Review browser console for CORS issues

4. **Database issues**
   - Delete `data/` folder to reset
   - Check file permissions
   - Verify SQLite installation

### Logs

- Backend logs: Check terminal running `start_backend.py`
- Frontend logs: Check browser console
- API logs: Check backend terminal output

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
1. Check the troubleshooting section
2. Check the browser console for errors
3. Review backend logs in the terminal
4. Check the API endpoints in the code if needed

---

**Happy Demo-ing! 🎉**
