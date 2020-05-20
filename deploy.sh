docker build -t anuu1989/multi-client -f ./client/Dockerfile ./client
docker build -t anuu1989/multi-server -f ./server/Dockerfile ./server
docker build -t anuu1989/multi-worker -f ./worker/Dockerfile ./worker
docker push anuu1989/multi-client 
docker push anuu1989/multi-server
docker push anuu1989/multi-worker
kubectl apply -f k8s
