# comicbook2pdf

Tool to convert a comic book to a pdf.


## How to use it

Execute the command tool providing as argument the file to convert to pdf.
Only `.cbr` and `.cbz` extensions are allowed for conversion.
If a file with the same basename and `.pdf` extension already exists in the folder, this will be replaced.

Command is the following

```
$ sh ./comicbook2pdf.sh MyComic.cbr

The MyComic.cbr is converted to MyComic.pdf!
```

```
$ sh ./comicbook2pdf.sh MyComic.cbz

The MyComic.cbz is converted to MyComic.pdf!
```

And output will be a `MyComic.pdf` in the same folder.
