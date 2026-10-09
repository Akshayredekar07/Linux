# **Awesome Linux**

<p align="center">
  <img src="https://cdn.simpleicons.org/linux/fc4c02" width="13%" alt="Linux Logo"/>
</p>

<p align="center">
  A structured, practical Linux course. It starts at the command line and shell scripting, then moves on to the skills behind modern DevOps.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Linux-fc4c02?style=flat-square&logo=linux&logoColor=white" alt="OS: Linux"/>
  <img src="https://img.shields.io/badge/Language-Bash-ef2cc1?style=flat-square&logo=gnubash&logoColor=white" alt="Language: Bash"/>
  <img src="https://img.shields.io/badge/Focus-DevOps-bdbbff?style=flat-square&logo=gnometerminal&logoColor=black" alt="Focus: DevOps"/>
  <img src="https://img.shields.io/badge/Environment-Ubuntu%20%7C%20WSL2-c8f6f9?style=flat-square&logo=ubuntu&logoColor=black" alt="Environment: Ubuntu and WSL2"/>
</p>

This repository is a complete Linux reference, built phase by phase around real terminal practice. It begins with the filesystem and core commands, then covers streams, regular expressions, and text processing. After that it moves into Bash scripting and automation, and it ends with the skills used on production systems: process and service management, networking, storage, logging, and security.

Every phase stands on its own, with short written theory, runnable practice files, and exercises. The material matches what DevOps and cloud engineering work asks for, because Linux skill is the base that containers, CI/CD, and infrastructure as code are built on.


---

## **Safety Note**

Some labs, such as permissions, users, storage, and security hardening, change system settings. A wrong command can lock you out or damage files.

- Run these labs in a VM, a container, or a fresh WSL2 install, never on your main machine.
- Read each script before you run it.
- Take a snapshot of your VM before the storage and security phases.

---

## **Setup**

| Tool | Check | Used for |
|---|---|---|
| WSL2 + Ubuntu (or any Linux VM or Docker) | `lsb_release -a` | Lab environment |
| Bash 5 or newer | `bash --version` | Running scripts |
| GNU coreutils, grep, sed, gawk | `gawk --version` | Text processing phases |
| ShellCheck | `shellcheck --version` | Checking scripts for mistakes |
| Git | `git --version` | Cloning the repo |

**Get the repo:**

```bash
git clone https://github.com/akshayredekar07/linux.git
cd linux
```

**Windows users:** open PowerShell as Administrator and run `wsl --install -d Ubuntu`, then restart your computer and open the Ubuntu app.

**Install the tools on Ubuntu:**

```bash
sudo apt update
sudo apt install -y git gawk shellcheck
```

**Quick start for any phase:**

```bash
cd 11__shell-basics
cat README.md                    # phase overview
bash lab/first.sh                # run a lab script
chmod +x lab/first.sh            # or make it executable
./lab/first.sh                   # and run it directly
```

---

## **Roadmap Overview**

| Phase | Folder | Focus |
| ---: | --- | --- |
| 1 | [`01__fundamentals/`](01__fundamentals/) | Components, hierarchy, file types |
| 2 | [`02__navigation/`](02__navigation/) | Paths, `ls`, directories |
| 3 | [`03__file-operations/`](03__file-operations/) | Create, copy, move, symlinks |
| 4 | [`04__viewing-comparing/`](04__viewing-comparing/) | `cat`, `less`, `diff` |
| 5 | [`05__text-processing/`](05__text-processing/) | `wc`, `sort`, `paste`, `tr` |
| 6 | [`06__streams-pipes/`](06__streams-pipes/) | Redirection, pipes, `tee`, `xargs` |
| 7 | [`07__find-locate/`](07__find-locate/) | `locate`, `find` |
| 8 | [`08__regex-grep/`](08__regex-grep/) | Regular expressions, `grep` |
| 9 | [`09__permissions/`](09__permissions/) | Permissions, `umask`, `sudo` |
| 10 | [`10__editors/`](10__editors/) | vi and vim |
| 11 | [`11__shell-basics/`](11__shell-basics/) | Scripts, variables, arguments, `.bashrc`, aliases, `PATH`, environment variables, dotfiles |
| 12 | [`12__control-flow/`](12__control-flow/) | Tests, `case`, loops |
| 13 | [`13__arrays-functions/`](13__arrays-functions/) | Arrays, functions |
| 14 | [`14__sed-awk/`](14__sed-awk/) | `sed`, `awk`, `jq` for JSON, YAML basics |
| 15 | [`15__advanced-scripting/`](15__advanced-scripting/) | `trap`, `getopts`, strict mode |
| 16 | [`16__users-groups/`](16__users-groups/) | Users and groups |
| 17 | [`17__processes-services/`](17__processes-services/) | Processes, job control (`bg`, `fg`, `nohup`), signals, boot process, systemd, cron |
| 18 | [`18__networking-ssh/`](18__networking-ssh/) | Networking, SSH, `curl`, firewalls (`ufw`, `nftables`), time sync |
| 19 | [`19__storage-packages/`](19__storage-packages/) | Disks, filesystems, mounting, LVM, packages, archives, backups with `rsync` and `tar` |
| 20 | [`20__logging-monitoring/`](20__logging-monitoring/) | Logs, performance tools |
| 21 | [`21__security-hardening/`](21__security-hardening/) | SSH hardening, firewall rules, SELinux |
| 22 | [`22__devops-toolchain/`](22__devops-toolchain/) | Containers, cloud, Git, Ansible, `make` and Makefiles |
| 23 | [`23__projects/`](23__projects/) | Full shell projects |
| 24 | [`24__resources/`](24__resources/) | Cheat sheets, references |


---

## **Phase 22 and 23 Details**

**Phase 22: DevOps toolchain**

- Containers with Docker: images, containers, volumes, networks
- Cloud basics: virtual machines, SSH access, simple deployments
- Git for daily work: branches, merges, tags
- Ansible: inventories, playbooks, simple roles
- `make` and Makefiles for repeatable tasks

**Phase 23: Projects**

- Backup script with `rsync` and rotation
- Log analyzer that counts errors and builds a report
- System health checker for CPU, memory, and disk
- User onboarding script that creates users and sets permissions
- Service watcher that restarts a failed service and sends an alert

---

## **Repo Structure**

```text
awesome-linux/
├── README.md
├── LICENSE
├── .gitignore
├── .github/workflows/shellcheck.yml
├── scaffold.sh
├── 01__fundamentals/ ... 24__resources/
│   ├── README.md          # phase overview
│   ├── theory/            # written lessons
│   ├── lab/               # runnable scripts and sample data
│   └── exercises/         # practice questions with answers
└── assets/
    ├── images/
    └── diagrams/
```

---


## **Contributing**

Fixes and new examples are welcome.

1. Fork the repo and create a branch.
2. Keep each phase in the same layout: `theory/`, `lab/`, `exercises/`.
3. Run `shellcheck` on every script before you open a pull request.
4. Open a pull request with a short note on what you changed.

---

## **License**

This project uses the license in the [LICENSE](LICENSE) file.

---

<p align="center">
  Built by <a href="https://github.com/akshayredekar07">@akshayredekar07</a> with ❤️
</p>