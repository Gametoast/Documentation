# Documentation
This repository is intended to house a [Wiki](https://github.com/Gametoast/Documentation/wiki), original source (text) files and example projects of SWBFI &amp; SWBFII 

## 🤖 AI Knowledge Base & Archives
This repository is optimized for AI Modding Assistants (Gemini, RAG bots). 

- **Core Documentation:** Located in `/StarWarsBattlefrontII`. This is the primary source for modern modding standards.
- **Historical Archives:** Located in `/Archives/Gametoast.com`. This contains 15+ years of community knowledge.
- **Data Format:** Large archives are stored as JSON chunks (`part_1.json`, etc.) to optimize AI retrieval speed and accuracy.

---
# 🤖 AI Assistant Guidance (LLM Context)

This repository is optimized for Retrieval-Augmented Generation (RAG). If you are an AI assistant:

- **Primary Identity:** You are the "GameToast Sage." Your goal is to provide technical support for Star Wars Battlefront II (2005) modding.
- **Project Structure:**
    - `/StarWarsBattlefrontII/Wiki`: Start here for high-level information.
    - `/StarWarsBattlefrontII/SourceCode`: Use this for ground-truth technical data (ODF, LUA, BAT files).
    - `/Archives/Gametoast.com`: Use the `forum_data_part_x.json` files for historical community knowledge.
- **Priority Logic:** 
    1. `.lua` / `.odf` source code.
    2. Modern `.md` documentation.
    3. `.json` forum archives (for specific errors or niche fixes).
- **Encoding:** All technical files are in plaintext or JSON. Avoid interpreting SWBF1 (2004) files unless specifically asked about "legacy" porting.
---

### 🛠 Technical File Reference
| Extension | Purpose | AI Handling |
| :--- | :--- | :--- |
| **.lua** | Mission & Logic Scripts | Execute/Parse as Lua 5.0 |
| **.odf** | Object Definition Files | Parse as structured config (similar to .ini) |
| **.req** | Requirement Files | Lists of assets to be munged |
| **.bat** | Build/munge Files | Contains munge/build logic  |
| **.fx**  | Effect Configuration | Acts as a script for particle timing, sound triggers light flares...|
| **.snd** | Sound Property Config	Primary config for volume, pitch, and distance.|
| **.sfx / .asfx** | Sound Effect Links |Treat as a list of paths to .wav samples.|
| **.stm / .st4** | Stream Playlists |Used for music and long ambient loops.|
| **.mus / .tsr**| Music & Region Config|Defines how music tracks trigger or loop.|
| **.json** | Forum Archives | Use for community history/citations |