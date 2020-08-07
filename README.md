# README
# SFIA 2 Project - Paul Lagah

## Table of Contents
1. Project Brief
   - Requirements
   - Overview
2. Trello Board
3. Risk Assessment
4. Project Design
   - CI Pipeline
   - Database
   - App Design 
5. Deployment
6. Improvement

## Project Brief
### ___Requirements___
The requirements of the project are as follows:

- An Asana board (or equivalent Kanban board tech) with full expansion on tasks needed to complete the project.
- An Application fully integrated using the Feature-Branch model into a Version - Control System which will subsequently be built through a CI server and deployed to a cloud-based virtual machine.
- If a change is made to a code base, then Webhooks should be used so that Jenkins recreates and redeploys the changed application.
- The project must follow the Service-oriented architecture that has been asked for.
- The project must be deployed using containerisation and an orchestration tool.
- As part of the project, you need to create an Ansible Playbook that will provision the environment that your application needs to run.
- The project must make use of a reverse proxy to make your application accessible to the user.

### ___Overview___
This app is a DnD Race/Class Generator.

Service 1 runs as the front end, displaying the output from Service 4. Service 4 gets a randomly generated race from Service 2, and a randomly generated classes from Service 3, then concatenates them in Service 4 before Service 1 gets them and displays them on the front end app.

![App](https://github.com/paullagah/DevOps/blob/master/App%20Overview.JPG)


## Trello Board

Trello Board is what was used to keep a track of my progress on the project and log errors.

![Trello](https://github.com/paullagah/DevOps/blob/master/SFIA2-Trello.JPG)

## Risk Assessment

Below you will see the risk assessment carried out for this project:

![Risk_Assessment](https://github.com/paullagah/DevOps/blob/master/SFIA2%20-%20Risk%20Assessment.JPG)


## Project Design
### ___CI Pipeline___

The Initial CI Pipeline design was made with fewer technologies in mind:

![CIPipelineOld](https://github.com/paullagah/DevOps/blob/master/CI%20Pipeline-old.jpg)


The Final CI Pipeline design completed with additional Docker Swarm set up with Ansible configuration added to manage it.

![CIPipeline](https://github.com/paullagah/DevOps/blob/master/CI%20Pipeline.jpg)

### ___Database___
A relatively simple table was designed for persisting data - the structure can be seen in the image below.

![Database](https://github.com/paullagah/DevOps/blob/master/SFIA2-Database.JPG)

### ___App Design___

The first image below shows the design made initially for the Race/Class Generator:

![AppInitialDesign](https://github.com/paullagah/DevOps/blob/master/SFIA2-App-first.JPG)

This next design implements the persisted data from previously generated Races/Classes:

![AppFinalDesign](https://github.com/paullagah/DevOps/blob/master/SFIA2-App.JPG)


## Deployment
The deployment of the app is automated and handled different tools such as Jenkins, Ansible and Docker. After committing any changes to my GitHub, Jenkins will trigger a pipeline job via a webhook set up through GitHub & Jenkins Configuration. The different stages of the pipeline are outlined in my Jenkinsfile, which for mine currently are: 
- Run Playbook 
- Build Images 
- Deploy Stack 
- Clean 
 
In order to improve readability, each step refers to a script which handles a different stage of the pipeline. First, Jenkins will checkout the Github repo then it will initiate the Jenkinsfile stages.

Here, Jenkins will configure my machines with the use of Ansible. My Ansible playbook specifies different roles which allow me to install different requirements depending on what each machine will be responsible for. For every machine, Ansible will install Docker. It will then configure my swarm - creating a swarm on my swarm manager, and joining that swarm on my worker machine.

Finally, Jenkins will deploy the application from the swarm manager machine using docker stack. This will balance the load of the containers across the two machines, just before performing clean-up exercises on the Manager node.

![PipelineStage](https://github.com/paullagah/DevOps/blob/master/SFIA-Pipeline-stage.png)


If there is any failures in the pipeline jobs then it will be displayed as the following.

![FailedStage](https://github.com/paullagah/DevOps/blob/master/SFIA2-Pipeline-stage-fail.png)

## Improvements

There could be some improvements made to the project, as stated below:
- Add a logo
- Implement a more graphical design
- Produce stats for character upon creation
- Suggest Name to be made for character, or apply an option of 3 different names
- Set up Search Functionality for their Character ID