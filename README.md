# solidity
Some solidity projects.

Installing the remix IDE on mac for using your own GitHub repo.
by Denis Putnam · less than a minute ago
Make sure that you have the full developer version of Xcode.app installed. As a precaution, go to the app store and install it regardless. Follow the instructions.

The goal is to get the remixd installed, but it needs the Xcode developer installed to do that.

The following websites will have the instructions, but I condensed them below in the steps.

Talks about the gyp install and the xcode-select comands:
https://github.com/nodejs/node-gyp/blob/master/macOS_Catalina.md

Talks about node-gyp and node-gyp-install:
https://github.com/nodejs/node-gyp/issues/569

Has the instruction for the online IDE locahost setup:
https://remix-ide.readthedocs.io/en/latest/remixd.html

Has the dmg to install on MAC:
https://github.com/ethereum/remix-desktop/releases

1. npm install -g node-gyp-install
2. sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
3. xcodebuild -version
4. npm install -g remixd
5. install the dmg file.
6. remixd -s /Users/denisputnam/git/solidity --remix-ide https://remix.ethereum.org
### remixd -s <absolute-path-to-the-shared-folder> --remix-ide https://remix.ethereum.org

In step 5. you will set it up for the online web IDE. Once you get the remix.app installed, activate the remix plugin from the plugins list. When it tries to connect to your local file system, you will get something like:

Sun Jan 19 2020 15:49:17 GMT-0500 (Eastern Standard Time) Connection from origin package://a7df6d3c223593f3550b35e90d7b0b1f.mod rejected.

Copy the "package://a7df6d3c223593f3550b35e90d7b0b1f.mod ".

Stop the remixd with Ctrl-C.

Then restart it with something like:

remixd -s /Users/denisputnam/git/solidity --remix-ide package://a7df6d3c223593f3550b35e90d7b0b1f.mod

Now the remixd will point to your local remix IDE rather than the online IDE.

So why do all this? So that you can create a repo in your own github account, clone it to your local file system, and then hookup your local remix IDE to use your local github repo. This will allow you to check in code to github.

/Users/denisputnam/git/solidity>git status
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
(use "git add <file>..." to include in what will be committed)

SimpleStorage.sol

nothing added to commit but untracked files present (use "git add" to track)

(base) Deniss-IMAC.fios-router.home:denisputnam
/Users/denisputnam/git/solidity>git add SimpleStorage.sol

(base) Deniss-IMAC.fios-router.home:denisputnam
/Users/denisputnam/git/solidity>git commit -m "Created file"
[master 149f099] Created file
1 file changed, 13 insertions(+)
create mode 100644 SimpleStorage.sol
(base) Deniss-IMAC.fios-router.home:denisputnam

/Users/denisputnam/git/solidity>git push
Username for 'https://github.com/denismp/solidity.git': xxxxx
Password for 'https://denismp@github.com/denismp/solidity.git': xxxxx
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 437 bytes | 437.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/denismp/solidity.git
68347fb..149f099 master -> master
(base) Deniss-IMAC.fios-router.home:denisputnam
/Users/denisputnam/git/solidity>

Of course, create you GitHub repo first, so that you can clone it to get started.

remixd -s /Users/denisputnam/git/solidity --remix-ide package://a7df6d3c223593f3550b35e90d7b0b1f.mod

Unfortunately, it doesn't seem to be possible to create new files in the localhost of the FILE EXPLORERS section of the remix IDE.  So I used the Visual Studio Code IDE in conjuction with the remix IDE, so that I can create and edit files locally in the VSC IDE, and then compile and deploy in the remix IDE.

Update:
It is possible to to use:
remixd -s /Users/denisputnam/git/ECR721LotteryGift --remix-ide http://remix.ethereum.org

Notice the http vs the https.  This will allow you to use the remix IDE in the browser and see the local directory on your machine.

To do this:
1. Start the remixd as shown above.
2. In the remix IDE that you started at http://remix.ethereum.org, connect to localhost.
    You will see:
    Sat Feb 08 2020 13:55:21 GMT-0500 (Eastern Standard Time) Remixd is listening on 127.0.0.1:65520
    Sat Feb 08 2020 13:55:51 GMT-0500 (Eastern Standard Time) Connection accepted.
3. At this point you should see your local files in the browser remixIDE.
4. You can then use the Visual Studio Code (VSC) to edit and syntax check your code.
    1. If you have to set the compiler version in the VSC IDE, then create the file .vscode/settings.json in the
        project home directory and add the following text:
        {
            "solidity.compileUsingRemoteVersion": "0.5.5+commit.47a71e8f"
        }
    2. This will cause the VSC solidity compiler to use version 0.5.5.
5. At this point, any changes that you make locally in VSC or in the browser IDE will be reflected on both sides.
    1. This will allow you to have a git repo on your local machine that is connected to github on the web and
        allow to check in changes to your remote github account.