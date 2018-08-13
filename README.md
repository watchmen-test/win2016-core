# Image for Watchmen

This is the virtual image that we use for the watchmen organization. This is how we generate our golden image that we use
in our production workloads. Part of the mantra of the cloud initative for watchmen is that our images are always clean
and we want to treat our infrastructure as immutable.  

## Getting Started

Clone the repo from this github repository to startup the project, the first thing you will want to do is read the README.

```
✓ Thats a check if you are reading this.
```

This project uses packer and uses the cloud to build the image, one of the creed when we started the watchmen project was to ensure
that our infrastructure remains in a always deployable state.  For that reason we have decided to build our infrastructure with 
Packr. The cloud of choice that we chosen for automation is azure, however we still deploy inside our own data center. Read the prereqs for information on downloading and installing packer. 

If you want to build you can use the python script that is included in this repository. The tasks file that is included will ensure that we can build and our software in a repeatable manner.

The easiest way to see what tasks we have availbe to use is to run the `inv -l` command in a shell. This can be on windows or linux. 


### Prerequisites

You will need the following you can use scoop to manage your dependcies on windows and use apt-get on linux.

Windows (Powershell 3 is Required)

```powershell
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
set-executionpolicy unrestricted -s cu
```

```cmd
scoop bucket add extras
scoop bucket add watchmen-test https://github.com/watchmen-test/scoop-bucket
scoop install packer azure-cli python@3.7.0 json2hcl jq
pip install --user pipenv
```




### Installing

To get the build up and running on your machine do the following. You will need pipenv installed for this to work. Please see prerequisites.

```
pipenv install
```

To run a build using the tooling use the `inv build` you will need to make sure that you provide the correct approariate secrets for the build to run. 


## Running the tests

Testing for the system is used with our test repo for infrastructure aware testing. Please follow the guidelines in infra testing to complete that work. 


### And coding style tests



```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Packer](https://www.packer.io/intro/index.html) - It builds VM's in a reproducable way
* [PyInvoke](http://www.pyinvoke.org/) - Python Tasks 
* [pyHCL](https://github.com/virtuald/pyhcl) - Used to generate json from HCL file



## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Used purplebooths readme template
* Inspiration
* etc
