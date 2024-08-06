**gocommit - Your Personal Commit Message Assistant - ollama based !**

Are you tired of crafting commit messages that are both informative and concise? Look no further! gocommit is here to revolutionize your Git workflow with its AI-powered commit message generation capabilities.

**What does it do?**

gocommit takes the output from a git diff, summarizes the most important changes, and then generates a professional-looking commit message with a tagged title and details about the changes. This saves you time and ensures that your codebase is always well-documented.

**Key Features:**

* **Automatic Commit Message Generation**: gocommit uses AI via ollama to generate high-quality commit messages based on the changes in your Git diff.
* **Context-Aware**: The tool understands the context of the changes and generates a message that accurately reflects the impact of those changes.
* **Customizable**: You can customize the prompt templates for summarizing diffs and generating commit messages to suit your team's needs.
* **Easy Integration**: gocommit integrates seamlessly with Git, making it easy to incorporate into your existing workflow.

**How does it work?**

1. Set the ollama endpoint if it is not localhost
   `export OLLAMA_URL=https://api.your-ollama-instance.com:11434`
2. Pipe a diff into gocommit : `git diff --staged | gocommit`
3. The tool summarizes the most important changes and generates a commit message based on those changes.

Optionally customize the prompt templates COMMIT_MESSAGE_PROMPT to fit your team's (and models) needs.

**Leveraging Ollama**

gocommit uses Ollama's powerful AI models to generate commit messages. You can configure the Ollama URL via environment variables to ensure smooth integration.

**Building Instructions:**
To build gocommit from source, follwo these steps:

1. Clone this repository by running `git clone https://github.com/xdadrm/gocommit.git` in your terminal.
2. Change into the cloned directory by running `cd gocommit`.
3. Build the tool by running `go build gocommit.go`. This will compile the code and create a binary in your current working directory.

Easily compile and use on various platforms:

```sh
GOARCH=amd64 GOOS=linux go build    # Linux with x86_64
GOARCH=arm64 GOOS=linux go build    # Linux Arm64 (RPi)
GOARCH=amd64 GOOS=windows go build  # Windows x86_64 exe
```

**Get Started!**

Simply run:

```sh
git diff --staging | gocommit
```

Prompts, Ollama models, and the URL can be configured via environment variables or a .ini file.

```sh
gocommit --help
```

**Models**
Preliminary testing models with the prompts used in gocommit shows that some models respond better to them than others. Yet, tweaking prompts may all that's needed to bring almost any model to shine !

Preferred:
- gemma2:27b / gemma2:latest
- llama3.1:8b / llama3.1:latest 
- codeqwen:latest
- mistral-nemo:latest
- internlm2:latest
- aya:latest

Working:
- gemma2:2b
- nuextract:latest        # very detailed
- dolphin-llama3:8b-256k  # not close to the template

Unsuitable:
- qwen2:7b                # does not follow the template
- nuextract:latest        # extremely detailed
- llama3-chatqa:latest    # no usable response
- dolphin-llama3:8b       # partially responds with instructions


**Join the Community!**

We're excited to have you join our community of developers who are passionate about improving their Git workflow. Share your experiences with gocommit, provide feedback, and contribute to the project if you'd like.

**License:**

gocommit is released under the MIT License. See LICENSE for more information.

**Contact Us!**

If you have any questions or would like to get in touch with us, please don't hesitate to reach out!

Happy coding with gocommit!
