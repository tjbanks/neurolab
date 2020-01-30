# Contributing

## Developing the Image Locally

1. Edit `Dockerfile` for software installations

2. Edit `rootfs/startup2.sh` for configuration of software after the image has been loaded


## Derivative projects

To create your own docker image based off of NeuroLab place the following at the top of your `Dockerfile`

```
from tylerbanks/neurolab:0.1.0
```

For system changes after startup create a `starup_extra.sh` and copy it to the root filesystem. It will run automatically

## Pushing Neurolab (or derivative) to Docker Hub


Sign up for an account on https://hub.docker.com/. After verifying your email you are ready to go and upload the docker image.

1. Log in on https://hub.docker.com/
2. Click on Create Repository.
3. Choose a name (e.g. neurolab) and a description for your repository and click Create.

4. Log into the Docker Hub from the command line

```
docker login --username=yourhubusername --email=youremail@mail.missouri.edu
```

just with your own user name and email that you used for the account. Enter your password when prompted. If everything worked you will get a message similar to

```
WARNING: login credentials saved in /home/username/.docker/config.json
Login Succeeded
```

5. Check the image ID using

```
docker images
```

and what you will see will be similar to

```
REPOSITORY              TAG       IMAGE ID         CREATED           SIZE
verse_gapminder_gsl     latest    023ab91c6291     3 minutes ago     1.975 GB
verse_gapminder         latest    bb38976d03cf     13 minutes ago    1.955 GB
rocker/verse            latest    0168d115f220     3 days ago        1.954 GB
```

and tag your image

```
docker tag bb38976d03cf yourhubusername/neurolab:0.1.0
```

The number must match the image ID and :0.1.0 is the tag. 

6. Push your image to the repository you created

```
docker push yourhubusername/neurolab
```

Your image is now available for everyone to use.


___

Guide adapted from (https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html)