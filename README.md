# neural-style docker

This is a docker implementation of 
[jcjohnson neural-style](https://github.com/jcjohnson/neural-style/) solution.

# setup

## 1. Install docker
Install docker using [that instructions](https://docs.docker.com/engine/installation/)

## 2. Install this container 
```
docker pull ffedoroff/neural-style
```

# run

## 
You should create folder for your source and style images.
For example 

```
mkdir ~/prism/01/
```

You should put images into that folder.
For example `style.jpg` and `source.jpg`.


Then you should run docker container connected it to your local folder with lua script, which will do all magic

```
docker run -v ~/prism/01:/out -i -t ffedoroff/neural-style th neural_style.lua -gpu -1 \
-style_image style.jpg -content_image source.jpg
```

If you close your console, the process will terminate. So if you want to run it in backgroud, add `-d` parameter. 

```
docker run -v ~/prism/01:/out -i -d -t ffedoroff/neural-style th neural_style.lua -gpu -1 \
-style_image style.jpg -content_image source.jpg

docker run -v ~/prism/02:/out -i -d -t ffedoroff/neural-style th neural_style.lua -gpu -1 \
-style_image style.jpg -content_image source.jpg

docker run -v ~/prism/03:/out -i -d -t ffedoroff/neural-style th neural_style.lua -gpu -1 \
-style_image style.jpg -content_image source.jpg
```
