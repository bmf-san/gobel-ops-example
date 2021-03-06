---
master_new_user_name: ${new_user_name}
master_new_user_password: ${new_user_password}
master_public_key: ${public_key}
master_ssh_port: ${ssh_port}
%{ for node in worker_nodes}
${node.host_name}: new_user_name: ${node.new_user_name}
${node.host_name}: new_user_password: ${node.new_user_password}
${node.host_name}: public_key: ${node.public_key}
${node.host_name}: ssh_port: ${node.ssh_port}
% {endfor ~}