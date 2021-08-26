docker build -t charlytron/multi-client -f ./client/Dockerfile ./client
docker build -t charlytron/multi-server -f ./server/Dockerfile ./server
docker build -t charlytron/multi-worker -f ./worker/Dockerfile ./worker
docker push charlytron/multi-client
docker push charlytron/multi-server
docker push charlytron/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server charlytron/multi-server


