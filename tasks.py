from invoke import task 

@task
def compile_configs(c):
    '''
    This will compile the config files from HCL to json.

    This task is ran before build task.
    '''
    c.run("hcl2json < ./config/azure.hcl > win2018.json.gen")
    c.run("hcl2json < ./config/vars.hcl > vars.json.gen")


@task(compile_configs, help={'cloud-token':"This is the token to use", 'version':"The version to build"})
def build(c, cloud_token, version):
    '''
    This will start the build of the vm. The target will deploy the resulting box file to Vagrant cloud
    using a version. 
    '''
    command = "packer build -parallel=false -color=true  -var-file=\"vars.json.gen\" -var=""cloud_token={0}"" -var=""version={1}"" ./win2018.json.gen".format(cloud_token, version)
    c.run(command)