# Kubernetes Assessment

This module aims to assess the candidate in Kubernetes knowledge by asking a number of questions. It is recommended to use Docker Desktop with Kubernetes enabled as it will aid you in showing your working

## Scenario

You have been asked to quickly demonstate a few key areas of Kubernetes to a colleague as they are eager to learn and see some of the fundamentals in action.

## Question 1

Create a deployment file called app using the image sirfragalot/docker-demo:dcus. The deployment must have two replicas.
Please name the file DeploymentTest.yaml.

## Question 2

Create the deployment in a namespace called test

1 - Primeiro criar o namespace

```
# kubectl create -f ./test-namespace.yaml or kubectl create namespace test
```

2 - Criar o deployment

```
# kubectl create -f deployment.yaml --namespace=test
```

## Question 3

Expose the Deployment so that app's contents can be seen on your local machine. Hint - sirfragalot/docker-demo:dcus runs on port 8080

```
# kubectl expose deployment/test -- type="NodePort" --port 8080
```

## Question 4

Scale the replicas up to 5 and record the action. Show the recorded action and the new replicas being used

```
# kubectl scale deployment.v1.apps/test --replicas=5
```

## Question 5

Using kubectl, show only the pods IPs and health under the headers IP and HEALTH
