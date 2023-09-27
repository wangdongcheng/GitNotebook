# How to ignore whitespace in github when comparing? - Stack Overflow
https://stackoverflow.com/questions/37007300/how-to-ignore-whitespace-in-github-when-comparing#:~:text=On%20github%2C%20you%20simply%20append,for%20it%20to%20ignore%20whitespace.

I have committed a file after prettifying it in sublime. Now when I am comparing the differences in GitHub web UI it's showing a lot of changes, so it is very difficult to see the actual changes. Can I compare files in there and ignore the whitespace?

[

![](https://i.stack.imgur.com/cP8pZ.jpg?s=64&g=1)


](https://stackoverflow.com/users/1709587/mark-amery)

[Mark Amery](https://stackoverflow.com/users/1709587/mark-amery)

144k81 gold badges406 silver badges459 bronze badges

asked May 3, 2016 at 14:44

[

![](https://www.gravatar.com/avatar/e517358d2ffcdb9069777fb17236773c?s=64&d=identicon&r=PG&f=y&so-version=2)


](https://stackoverflow.com/users/3144344/shekhardtu)

0

On github, you simply append the `w=1` parameter to the URL for it to ignore whitespace.

That would look something like:

```
https://github.com/account_name/repo/pull/14/files?w=1

```

answered May 10, 2016 at 17:28

[

![](https://www.gravatar.com/avatar/a4b305f0077055b4fdcf715067775d5a?s=64&d=identicon&r=PG)


](https://stackoverflow.com/users/3109182/anthony)

[Anthony](https://stackoverflow.com/users/3109182/anthony)Anthony

15.5k4 gold badges39 silver badges69 bronze badges

