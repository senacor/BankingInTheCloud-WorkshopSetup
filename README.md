# BankingInTheCloud-WorkshopSetup
This repo gives general instructions for the BankingInTheCloud workshops we provide. 

## Where to start

If the workshop did not start yet then please follow the instructions in the [before-workshop folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/before-workshop).
If the workshop already started follow the instructions in the [during-workshop folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/during-workshop).

The before-workshop folder provides setup information using a virtual machine (using Vagrant). If you want to do the setup locally you can refer to the [alternative-setup folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/alternative-setup).

## Workshop Information

This is what we do in the banking in the cloud workshop:

1. Introduction to the technology stack includes introductions to... 
  1.1 Microservices Architectures
  1.2 Spring Boot
    1.1.1 Spring Boot Basics (REST controller, ...)
    1.1.2 Spring Cloud Config 
    1.1.3 Spring Data & Flyway
  1.3 Service Discovery (Eureka)
  1.4 Messaging and Event Sourcing (ActiveMQ)
  1.5 Docker & Docker-Compose
2. Introduction to cloud-computing includes:
  2.1 Definition and basics of cloud computing
  2.2 Introduction to amazon AWS platform 
3. Setup and startup fineract-project
  3.1 Detailed information can be found in the [BankingInTheCloud-Fineract repo](https://github.com/senacor/BankingInTheCloud-Fineract)

**Goal:** After the workshop participants are able to work with the fineract project. They understand the basic concepts of microservices architectures and the tools that are necessary to work with them. After the workshop participants are able to explore the fineract project in depth on their own.   

Note that it depends on the workshop time and number of participants how much of the outline can really be done. The workshop is generally designed for five whole day, but can be shortened to two-four days. Workshops shorter than five days might not include the complete setup of fineract but a simpler example.