This repository contains a version of the
[syzygy-intro](https://intro.syzygy.ca) site re-written with quarto.
To publish just with quarto just make sure you have a python environment with
everything your code needs then use quarto itself to to push the finished
content up to netlify.

```bash
conda activate quarto
quarto publish netlify
```

Assuming you have configured authentication, that should be enough.

