docker build -t anuu1989/multi-client:latest -t anuu1989/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t anuu1989/multi-server:latest -t anuu1989/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t anuu1989/multi-worker:latest -t anuu1989/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push anuu1989/multi-client:latest
docker push anuu1989/multi-server:latest
docker push anuu1989/multi-worker:latest

docker push anuu1989/multi-client:$SHA
docker push anuu1989/multi-server:$SHA
docker push anuu1989/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=anuu1989/multi-server:$SHA
kubectl set image deployments/client-deployment client=anuu1989/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=anuu1989/multi-worker:$SHA
