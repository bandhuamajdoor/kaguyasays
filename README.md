![title of project](/README%20images/title.png)

A fun terminal companion that prints quotes inside a styled text box and shows a divine Kaguya-sama image below. 💖

It's perfect for greeting you every time you open a new terminal\!

![demo image](/README%20images/demo.png)

-----

## 📦 Installation

Choose your preferred method.

#### Method 1: Clone the Repository

```bash
git clone https://github.com/bandhuamajdoor/kaguyasays.git
cd kaguyasays
chmod +x install.sh
sudo ./install.sh
```

#### Method 2: One-Liner Install (via `curl`)

```bash
curl -sL https://raw.githubusercontent.com/bandhuamajdoor/kaguyasays/main/install.sh | sudo bash
```

> **What the installer does:**
>
>   * Places the `kaguyasays` executable in `/usr/local/bin`.
>   * Creates the configuration directory and quotes file at `~/.config/kaguyasays/quotes.txt`.
>   * Downloads the `kagu.png` image into `~/.config/kaguyasays/`.
>   * Attempts to install the required dependencies (`chafa`, `fortune`, `lolcat`) using your system's package manager.

-----

## ▶️ Usage

`kaguyasays` is flexible and can be used in several ways.

#### 1\. Get a Random Quote

Simply run the command to get a random quote from your personal quote file `quotes.txt`.

```bash
kaguyasays
```

#### 2\. Display Custom Text

You can pass text directly to `kaguyasays` either as an argument or by piping it.

  * **As an argument:**
    ```bash
    kaguyasays "helooo print this shit"
    ```
  * **Piping with `echo`:**
    ```bash
    echo "helooo print this shit" | kaguyasays
    ```

<p align="center">
<img src="/README%20images/typed_infront.png" alt="text typed to the left of kaguyasays" width="49%"/>
<img src="/README%20images/echo_piped.png" alt="echo piped along with kaguyasays" width="49%"/>
</p>

#### 3\. Piping with Other Commands

Combine `kaguyasays` with other fun terminal tools.

  * **With `fortune`:**

    ```bash
    fortune | kaguyasays
    ```
    ![fortune piped alongside kaguyasays](/README%20images/fortune_piped.png)

  * **With `lolcat` for a rainbow effect:**

    ```bash
    kaguyasays "nagpurr ki pablic" | lolcat
    ```
    ![used lolcat to add some colors](/README%20images/lolcat_piped.png)

-----

## ✍️ Managing Your Quotes

Personalize `kaguyasays` by adding your favorite quotes.

Your quotes are stored in a simple text file located at:
`~/.config/kaguyasays/quotes.txt`

You can edit this file with any text editor. Since you use Neovim:

```bash
nvim ~/.config/kaguyasays/quotes.txt
```

  * **Format:** Each quote must be separated by `%%` on its own line.
  * **Multi-line quotes** are fully supported\!

**Example `quotes.txt`:**

```
The world is your oyster.
%%
This is a
multi-line quote. It works
perfectly!
%%
How cute.
```

-----

## 💡 Tips & Tricks

#### 1\. Greet Yourself on Terminal Startup

Have Kaguya-sama greet you every time you open a new terminal by adding `kaguyasays` to your shell's startup file.

  * **For Fish:** Add to `~/.config/fish/config.fish`

    ```fish
    # Add this to the end of the file
    if status is-interactive
        kaguyasays
    end
    ```

  * **For Bash:** Add to `~/.bashrc`

    ```bash
    # Add this to the end of the file
    kaguyasays
    ```

  * **For Zsh:** Add to `~/.zshrc`

    ```zsh
    # Add this to the end of the file
    kaguyasays
    ```

#### 2\. Create a Custom `clear` Command

Create an alias or function that clears the screen and then runs `kaguyasays`.

  * **For Fish:** Create a new function at `~/.config/fish/functions/cleark.fish`

    ```fish
    function cleark
        clear
        kaguyasays
    end
    ```

  * **For Bash/Zsh:** Add this function to your `~/.bashrc` or `~/.zshrc`

    ```bash
    cleark() {
        clear
        kaguyasays
    }
    ```

Now, just run `cleark` for a fresh, Kaguya-blessed terminal.

-----

## ⚙️ Dependencies

  * **Required:**
      * `chafa`: A powerful terminal graphics utility used to display the image.
  * **Optional (but recommended for full experience):**
      * `fortune`: Provides a database of random adages and quotes.
      * `lolcat`: Adds a touch of rainbow color to the output.

The installation script will try to install these for you.

-----

## 🗑️ Uninstallation

#### Method 1: From Cloned Directory

If you still have the cloned repository, run the uninstaller script.

```bash
# Inside the kaguyasays directory
chmod +x uninstall.sh
sudo ./uninstall.sh
```

#### Method 2: One-Liner Uninstall (via `curl`)

```bash
curl -sL https://raw.githubusercontent.com/bandhuamajdoor/kaguyasays/main/uninstall.sh | sudo bash
```

#### Method 3: Manual Removal

```bash
sudo rm -f /usr/local/bin/kaguyasays
rm -rf ~/.config/kaguyasays
```

-----

## 🤝 Contributing

Want to make Kaguya-sama even more fabulous? Contributions are welcome\! Feel free to open an issue or submit a pull request.

-----

## 📜 License

This project is licensed under the **MIT License**. Do whatever you want, but please don't forget to love Kaguya-sama. 😁

-----

✨ Enjoy your daily dose of wisdom from **kaguyasays**\!