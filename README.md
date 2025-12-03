# Airy

Light-font pastel-colored LaTeX templates inspired by the [Thud](https://github.com/miculan/thud) template, designed to give a fresh, modern and calming feeling to scientific papers and presentations.

The classes provided in this repository are:
- **academica**: built upon the standard *book* class (*i.e.*, papers/articles/journals);
- **presenta**: built upon the standard *beamer* class (*i.e.*, slides).

## Configuration

To apply any of these templates, just copy the content of class folder that you want to use (*e.g.*, **academica** or **presenta**) into your working folder.
Then, you just need to specify it as the documentclass, e.g.

```tex
\documentclass{academica}
```

For each class is provided an example file (`example.tex`) and template one (`main.tex`).

## Compilation

It's also provided [biblatex](./biblatex), which is a simple bash script to compile the latex file using lualatex and biber.
