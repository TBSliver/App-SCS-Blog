# Blog plugin for App-SCS

add the following to the plugins array:

```
Blog => {}
```

And then add the following to the head of your Archive page:

```
<meta name="plugins" content="BlogArchive, { max_depth: 3, min_depth: 1 }" />
```

Changing settings as needed
