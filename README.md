# SketchPod [![Dependency Check](http://img.shields.io/david/ryanj/sketchpod.svg)](https://david-dm.org/ryanj/sketchpod)

To deploy a clone of this application using the [`rhc` command line tool](http://rubygems.org/gems/rhc):

    rhc app create sketchpod nodejs-0.10 --from-code=https://github.com/CoolZeroNL/sketchpod.git
    
## Local Development 
Install dependencies:

```bash
npm install
```

Start a local server, passing in config via the environment:

```bash
CUID=007 USERNAME=foo SUBMISSION="openshift for the win!" npm start
```

Next, load the index page to check the initial content.  Then run upload an image by running the `post_image.manual.js` script in another terminal:

```bash
OPENSHIFT_SERVER="http://localhost:8080" CUID="007" SUBMISSION="yes!" USERNAME="joe" node post_image.manual.js
```

Reload the index page to verify that the sketchpod has received it's content submission.

## Docker
To run [the related docker image](https://registry.hub.docker.com/u/harwig/sketchpod/):

```bash
docker pull harwig/sketchpod
docker run -d -p 8080:8080 -e "HOSTNAME=localhost" -e "CUID=007" -e "USERNAME=user007" -e "SUBMISSION=openshift for the win!" harwig/sketchpod
```

## OpenShiftV3
First, choose an application name for this service and update the template to replace all instances of `APP_NAME`:

```bash
sed -i -e 's/APPNAME/sketchpod/g' app_template.json
```

Then, launch the service using the `osc` command-line tool:
```bash
osc create -f app_template.json
```

## License
This code is dedicated to the public domain to the maximum extent permitted by applicable law, pursuant to CC0 (http://creativecommons.org/publicdomain/zero/1.0/)
