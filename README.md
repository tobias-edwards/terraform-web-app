App service has built-in support for:

- Node.js, Python, PHP, Java, etc.
  -> Allows for source code web app deployments

App Service plan - defines the set of compute resources for your web app to run on. Each plan defines:

- OS (Windows, Linux)
- Region
- Number of VM instances
- Size of those VM instances
- Pricing tier

Free tier will run our web app on the same VMs as other people's web apps. We get allocated a CPU quoata (in minutes) on the VM, and we can't scale out.

# Steps

1. [Create a free Azure account](https://azure.microsoft.com/en-gb/free/)

2. [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)

You should be able to enter `az` in your terminal.

3. Log in to your Azure account via the Azure CLI:

`az login`

This lets you manage your Azure account from your terminal e.g. check which resources have been spun up. Type `az` for a full list of things you can do.

Once logged in, you should be able to enter `az account show` and see your credentials.

4.
