# GameToast Forum Archive (Cleaned & Split)

This directory contains a "Lean" export of the GameToast.com forums. 

### Data Structure for AI Agents:
- **Files:** `forum_data_part_1.json`, `forum_data_part_2.json`, `forum_data_part_3.json`, `forum_data_part_4.json`,`forum_data_part_5.json`,`forum_data_part_6.json`,`forum_data_part_7.json`,`forum_data_part_8.json`,`forum_data_part_9.json`,`forum_data_part_10.json`,`forum_data_part_11.json`,`forum_data_part_12.json`.
- **Content:** Each file contains a list of threads. 
- **Fields:** - `title`: The topic of discussion.
  - `author`: The original poster (useful for citations).
  - `content_text`: The raw text of the post (HTML has been stripped for token efficiency).

### Retrieval Guidelines:
1. **Troubleshooting:** Use these files when a user reports a specific error code or "Munge" failure not found in the Wiki.
2. **Context:** If a solution is found here, prefix your answer with: *"Based on archived discussions from GameToast..."* 3. **Hierarchy:** If a post from 2007 conflicts with a `.md` file in the root directory, prioritize the `.md` file.
