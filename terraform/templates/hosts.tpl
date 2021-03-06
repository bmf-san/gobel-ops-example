[${master_host_name}]
${master_host_name} ansible_host=${master_host_ip} ansible_ssh_private_key_file=${master_path_to_private_key}
%{ for i, node in worker_nodes}
[${node.host_name}]
${node.host_name} ansible_host=${worker_ips[i].ip} ansible_ssh_private_key_file=${node.path_to_private_key}
%{endfor ~}