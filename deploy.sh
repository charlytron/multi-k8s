docker build -t charlytron/multi-client:latest -t charlytron/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t charlytron/multi-server:latest -t charlytron/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t charlytron/multi-worker:latest -t charlytron/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push charlytron/multi-client:latest
docker push charlytron/multi-server:latest
docker push charlytron/multi-worker:latest

docker push charlytron/multi-client:$SHA
docker push charlytron/multi-server:$SHA
docker push charlytron/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=charlytron/multi-server:$SHA
kubectl set image deployments/client-deployment client=charlytron/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=charlytron/multi-worker:$SHA


